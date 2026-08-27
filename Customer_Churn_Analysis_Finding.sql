SELECT *
FROM customer_churn
LIMIT 5;
SELECT COUNT(*)
FROM customer_churn;
SELECT
    COUNT(*) AS total_customers,
    
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn;

SELECT
    paymentmethod,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

SELECT
    internetservice,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY internetservice
ORDER BY churn_rate DESC;

SELECT
    contract,
    internetservice,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY contract, internetservice
ORDER BY churn_rate DESC;

SELECT
    contract,
    internetservice,
    paymentmethod,
    COUNT(*) AS total_customers,
    
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn

GROUP BY
    contract,
    internetservice,
    paymentmethod

ORDER BY churn_rate DESC;

WITH segment_analysis AS (
    SELECT
        contract,
        internetservice,
        paymentmethod,
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) AS churned_customers,
        ROUND(
            SUM(
                CASE
                    WHEN churn = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM customer_churn
    GROUP BY
        contract,
        internetservice,
        paymentmethod
)

SELECT *
FROM segment_analysis
WHERE churn_rate > 40
  AND total_customers >= 100
ORDER BY churn_rate DESC;

WITH segment_analysis AS (
    SELECT
        contract,
        internetservice,
        paymentmethod,
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) AS churned_customers,
        ROUND(
            SUM(
                CASE
                    WHEN churn = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM customer_churn
    GROUP BY
        contract,
        internetservice,
        paymentmethod
),

ranked_segments AS (
    SELECT
        *,
        RANK() OVER (
            ORDER BY churn_rate DESC
        ) AS churn_rank
    FROM segment_analysis
)

SELECT *
FROM ranked_segments
WHERE churn_rank <= 10
ORDER BY churn_rank;

WITH segment_analysis AS (
    SELECT
        contract,
        internetservice,
        paymentmethod,
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) AS churned_customers,
        ROUND(
            SUM(
                CASE
                    WHEN churn = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM customer_churn
    GROUP BY
        contract,
        internetservice,
        paymentmethod
),

ranked_segments AS (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY contract
            ORDER BY churn_rate DESC
        ) AS contract_rank
    FROM segment_analysis
)

SELECT *
FROM ranked_segments
WHERE contract_rank <= 3
ORDER BY contract, contract_rank;

SELECT
    customerid,
    contract,
    internetservice,
    monthlycharges,
    tenure,
    churn
FROM customer_churn
WHERE churn = 'Yes'
  AND monthlycharges >= 80
ORDER BY monthlycharges DESC;

WITH customer_segments AS (
    SELECT
        customerid,
        churn,

        CASE
            WHEN contract = 'Month-to-month'
                 AND tenure <= 12
                THEN 'High Risk'

            WHEN contract = 'Month-to-month'
                 AND tenure > 12
                THEN 'Medium Risk'

            ELSE 'Low Risk'
        END AS risk_segment

    FROM customer_churn
)

SELECT
    risk_segment,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_segments
GROUP BY risk_segment
ORDER BY churn_rate DESC;

WITH overall_churn AS (
    SELECT
        ROUND(
            SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS overall_churn_rate
    FROM customer_churn
),

segment_analysis AS (
    SELECT
        contract,
        internetservice,
        paymentmethod,
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) AS churned_customers,
        ROUND(
            SUM(
                CASE
                    WHEN churn = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM customer_churn
    GROUP BY
        contract,
        internetservice,
        paymentmethod
)

SELECT
    s.*,
    o.overall_churn_rate,
    ROUND(s.churn_rate - o.overall_churn_rate, 2) AS difference_from_overall
FROM segment_analysis s
CROSS JOIN overall_churn o
WHERE s.churn_rate > o.overall_churn_rate
  AND s.total_customers >= 100
ORDER BY difference_from_overall DESC;