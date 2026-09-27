# Power BI — AdventureWorks Sales Analytics

## Overview

Power BI dashboard built on the Gold layer of the AdventureWorks 2025 data engineering project.

The dashboard provides interactive analysis of sales performance across time, products, customers, and geography.

## Data Model

The Power BI model follows a dimensional star-schema approach.

### Dimensions

- DimDate
- DimProduct
- DimCustomer
- DimGeography

### Fact

- FactInternetSales

### External Data

- Frankfurter exchange-rate data

## Dashboard KPIs

- Total Sales
- Total Orders
- Total Quantity
- Average Order Value

## Analytics

- Sales Trend by Year
- Sales by Month
- Sales by Product Line
- Top 10 Products by Sales
- Top 10 Customers by Sales
- Top 10 Cities by Sales
- Sales by State/Province

## Interactive Filters

- Year
- Product Line
- Country
- State/Province

## Data Source

Power BI consumes the Gold Parquet datasets stored in Azure Data Lake Storage Gen2.

## Project Architecture

SQL Server / REST API
→ Azure Data Factory
→ ADLS Gen2 Bronze
→ Databricks
→ ADLS Gen2 Silver
→ Databricks
→ ADLS Gen2 Gold
→ Power BI
