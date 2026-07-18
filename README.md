# KYC-Risk-Screening-Project
Mock KYC/AML customer risk screening project using Python, MySQL and Power BI. 
# Customer Risk Screening & KYC Red-Flag Detection

A mock KYC/AML compliance project that simulates how a KYC analyst reviews customer profiles and transactions to identify financial crime risk indicators.

# Overview
This project generates a synthetic dataset of 1,000 customers and their transactions, applies rule-based red-flag logic using SQL, and visualizes the results in an interactive Power BI dashboard.

# Tools Used
- **Python** (Faker, Pandas): synthetic data generation
- **MySQL**: data storage and red-flag rule logic (SQL views)
- **Power BI**: dashboard and visualization

# Red-Flag Rules
Each customer/transaction is checked against the following rules:
1. **Income Mismatch** — transaction amount exceeds 2x declared income
2. **High-Risk Country Exposure** — counterparty country appears on a high-risk list (e.g. Iran, North Korea, Myanmar, Afghanistan, Syria)
3. **Document Issue** — customer's identification document is expired or missing
4. **PEP (Politically Exposed Person)** — customer is flagged as a politically exposed person

# Results
- **1,000** simulated customers and transactions
- **427** customers flagged across the four risk categories
- Dashboard visualizes flagged customers by risk type, nationality, and monthly trend

# Dashboard
![KYC Dashboard](kyc%20screening%20dashboard.png)

## Files
- `kyc_data_generation.ipynb`: Python script to generate synthetic customer/transaction data
- `customers.csv`, `transactions.csv`: generated datasets
- `queries.sql`: SQL red-flag rule logic and master risk view
- `Customer Risk Screening-Power BI.pbix`: Power BI dashboard file

## Note
This is a portfolio project using entirely synthetic data. It does not represent any real customer, institution, or production compliance system.
