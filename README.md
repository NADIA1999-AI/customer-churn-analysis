# customer-churn-analysis
End-to-end customer churn analysis using Python, SQL, and Power BI.
# 📊 Customer Churn Analysis

## 📌 Project Overview

Customer churn is one of the biggest challenges for subscription-based businesses. Retaining existing customers is often more cost-effective than acquiring new ones.

This project analyzes customer churn patterns using the **IBM Telco Customer Churn dataset**. The analysis was performed using **Python, SQL, and Power BI** to identify key factors associated with customer churn and generate actionable business insights.

The project demonstrates an end-to-end data analytics workflow, from data cleaning and exploratory analysis to SQL-based business analysis and interactive dashboard development.

---

# 🎯 Business Objective

The main objectives of this project are to:

* Identify the key factors influencing customer churn
* Analyze churn across different customer segments
* Understand the relationship between contract type and churn
* Explore the impact of tenure, internet services, payment methods, and demographics
* Identify high-risk customer groups
* Provide actionable recommendations to improve customer retention

---

# 🛠️ Tools & Technologies

* **Python** – Data cleaning, exploratory data analysis (EDA), visualization, and statistical analysis
* **Pandas & NumPy** – Data manipulation and analysis
* **Matplotlib & Seaborn** – Data visualization
* **SQL (PostgreSQL)** – Business analysis and customer segmentation
* **Power BI** – Interactive dashboard and business reporting
* **GitHub** – Project documentation and version control

---

# 📂 Project Structure

```text
Customer-Churn-Analysis/
│
├── Data/
│   └── Customer Churn Dataset
│
├── Python/
│   └── Customer_Churn_Analysis.ipynb
│
├── SQL/
│   └── Customer_Churn_Analysis.sql
│
├── Power BI/
│   └── Customer_Churn_Dashboard.pbix
│
├── Images/
│   └── Dashboard Screenshots
│
└── README.md
```

---

# 📊 Dataset Overview

The dataset contains **7,043 customer records** and includes information about:

* Customer demographics
* Account information
* Contract type
* Tenure
* Monthly charges
* Total charges
* Internet services
* Payment methods
* Additional services
* Customer churn status

### Target Variable

**Churn**

* `Yes` – Customer left the company
* `No` – Customer remained with the company

---

# 🔍 Data Analysis Workflow

## 1️⃣ Data Cleaning & Preparation

The dataset was prepared for analysis by:

* Checking missing values
* Handling data type inconsistencies
* Cleaning the `TotalCharges` column
* Performing exploratory data analysis
* Preparing the dataset for SQL and Power BI analysis

---

## 2️⃣ Exploratory Data Analysis Using Python

Python was used to explore customer behavior and identify important churn patterns.

Key areas analyzed:

* Overall churn distribution
* Customer tenure
* Contract type
* Internet service
* Payment method
* Senior citizen status
* Partner and dependent status
* Online security services
* Relationships between numerical variables
* Statistical significance using chi-square tests

---

# 📈 Key Insights

### 🔴 Contract Type Has a Strong Impact on Churn

Customers with **month-to-month contracts** showed significantly higher churn compared to customers with one-year and two-year contracts.

This suggests that customers with long-term contracts are more likely to remain with the company.

---

### 🔴 New Customers Are at Higher Risk

Customers with **0–6 months of tenure** had a churn rate of approximately **52.94%**.

In comparison, customers with **49–72 months of tenure** had a churn rate of only **9.51%**.

➡️ Customer retention efforts should focus heavily on the early stages of the customer lifecycle.

---

### 🔴 Fiber Optic Customers Show High Churn

Customers using **Fiber Optic internet service** had a churn rate of approximately **41.89%**.

This indicates a potential need to investigate:

* Pricing
* Service quality
* Customer satisfaction
* Competitor offerings

---

### 🔴 Electronic Check Users Have the Highest Churn

Customers using **Electronic Check** had a churn rate of approximately **45.29%**, significantly higher than other payment methods.

This customer segment may require further investigation and targeted retention strategies.

---

### 🔴 High-Risk Customer Segment Identified

The combination of:

* Month-to-month contract
* Fiber optic internet
* Electronic check payment

produced a churn rate of approximately **60.37%**.

This represents one of the most important high-risk customer segments identified during the analysis.

---

### 🔴 Online Security Is Associated With Lower Churn

Customers without online security showed a churn rate of approximately **41.77%**, compared with **14.61%** for customers who had online security.

This suggests that additional services may help increase customer engagement and retention.

---

# 🧮 SQL Analysis

SQL was used to answer business-focused questions and perform customer segmentation.

Examples of analysis include:

* Which contract type has the highest churn rate?
* Which payment method is associated with the highest churn?
* How does customer tenure affect churn?
* Which internet service has the highest churn?
* Which customer segments are most likely to churn?
* Identification of high-risk customer groups

The SQL analysis demonstrates the use of:

* `GROUP BY`
* Aggregate functions
* `CASE WHEN`
* Common Table Expressions (CTEs)
* Customer segmentation
* Business-focused queries

---

# 📊 Power BI Dashboard

An interactive **3-page Power BI dashboard** was created to communicate the results of the analysis.

The dashboard includes:

### 📌 Page 1: Churn Overview

* Total customers
* Churned customers
* Churn rate
* Key customer characteristics

### 📌 Page 2: Churn Drivers

* Churn by contract type
* Churn by internet service
* Churn by payment method
* Customer demographic analysis

### 📌 Page 3: Key Insights & Recommendations

* High-risk customer segments
* Major churn drivers
* Business insights
* Retention recommendations

---

# 💡 Business Recommendations

Based on the analysis, the following actions are recommended:

### 1. Focus on New Customers

Develop onboarding and engagement programs for customers during their first few months.

### 2. Encourage Long-Term Contracts

Offer incentives for customers to move from month-to-month contracts to one-year or two-year contracts.

### 3. Investigate Fiber Optic Customer Experience

Analyze pricing, service quality, and customer satisfaction among fiber optic customers.

### 4. Target High-Risk Customer Segments

Develop personalized retention campaigns for customers with:

* Month-to-month contracts
* Fiber optic internet
* Electronic check payments
* Low tenure

### 5. Promote Value-Added Services

Encourage adoption of services such as online security, which is associated with lower churn.

---

# 📌 Key Skills Demonstrated

This project demonstrates my ability to:

✔ Clean and prepare real-world datasets
✔ Perform exploratory data analysis
✔ Analyze customer behavior and churn patterns
✔ Write SQL queries for business analysis
✔ Perform customer segmentation
✔ Create interactive Power BI dashboards
✔ Generate actionable business insights
✔ Communicate analytical findings clearly

---

# 🚀 Conclusion

This project provides an end-to-end analysis of customer churn using **Python, SQL, and Power BI**.

The analysis identified several important churn drivers, including **contract type, customer tenure, internet service, payment method, and additional services**.

The findings can help businesses identify high-risk customers and develop targeted strategies to improve customer retention.

---

## 👩‍💻 Author

**Nadia**

Aspiring Data Analyst | Python | SQL | Power BI

⭐ If you found this project interesting, feel free to explore the repository!
