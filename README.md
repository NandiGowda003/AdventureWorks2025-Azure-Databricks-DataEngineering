# AdventureWorks 2025 — Azure Data Engineering Project

## Project Overview

An end-to-end data engineering project built using Azure Data Factory, Azure Data Lake Storage Gen2, Azure Databricks, SQL Server, REST API, GitHub, and Power BI.

The project demonstrates a modern Medallion Architecture with automated ingestion, data transformation, dimensional modeling, SCD Type 2, business KPIs, and analytics reporting.

## Project Planning in Notion Step By Step
https://app.notion.com/p/End-To-End-Pipeline-AdventureWorks2025-Azure-Data-bricks-3e4dd07fdfd0803db744c1da8e141bbd?source=copy_link

## Architecture

Local SQL Server + REST API
        ↓
Azure Data Factory
        ↓
ADLS Gen2 — Bronze
        ↓
Azure Databricks
        ↓
ADLS Gen2 — Silver
        ↓
Azure Databricks
        ↓
ADLS Gen2 — Gold
        ↓
Power BI

## Data Sources

### SQL Server

AdventureWorksDW2025 from local SQL Server.

Tables:

- DimCustomer
- DimProduct
- DimDate
- DimGeography
- FactInternetSales

### REST API

Frankfurter API is used as an external currency exchange-rate source.

The API data is ingested into the Bronze layer and transformed through the data pipeline.

## Medallion Architecture

### Bronze Layer

Raw data ingestion using Azure Data Factory.

SQL Server tables are dynamically copied to ADLS Gen2 using a metadata-driven ADF pipeline.

REST API data is also ingested into the Bronze layer.

### Silver Layer

Azure Databricks and PySpark are used for:

- Data cleansing
- Data type standardization
- Null handling
- Column selection
- Business transformations
- API data transformation

### Gold Layer

Business-ready dimensional and fact datasets are created for analytics.

Gold datasets include:

- DimCustomer
- DimProduct
- DimDate
- DimGeography
- FactInternetSales
- Frankfurter exchange-rate data

## SCD Type 2

SCD Type 2 metadata has been implemented for selected dimensions:

- DimCustomer
- DimProduct
- DimGeography

The Gold dimensions include:

- EffectiveStartDate
- EffectiveEndDate
- IsCurrent

## Gold Analytics

Business KPIs and analytical datasets include:

- Total Sales
- Total Quantity
- Total Orders
- Average Sales per Line
- Total Tax
- Total Freight
- Product Sales
- Customer Sales
- Geography Sales
- Product Line Sales
- Year-over-Year Sales
- Customer Ranking
- Sales Contribution

## Power BI Dashboard

The Gold layer is consumed by Power BI for interactive analytics.

Dashboard components include:

- Total Sales
- Total Orders
- Total Quantity
- Average Order Value
- Sales Trend by Year
- Sales by Product Line
- Top 10 Products by Sales
- Top 10 Customers by Sales
- Top 10 Cities by Sales
- Sales by State/Province
- Sales by Month

Interactive slicers are available for:

- Year
- Product Line
- Country
- State/Province

## Data Validation

Gold layer validation was performed for:

- Row counts
- Dimension integrity
- Fact-to-dimension relationships
- Orphan key checks
- API data availability

Fact-to-dimension orphan checks returned zero unmatched records.

## Technology Stack

- SQL Server
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Azure Databricks
- PySpark
- Spark SQL
- Power BI
- REST API
- Git
- GitHub
- GitHub Actions
- NOTION

## Repository Structure

```text
AdventureWorks2025-Azure-Databricks-DataEngineering/
├── adf/
│   ├── pipelines/
│   ├── datasets/
│   ├── linked-services/
│   └── triggers/
├── databricks/
│   ├── notebooks/
│   ├── jobs/
│   └── config/
├── sql/
│   ├── metadata/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── procedures/
├── api/
│   └── frankfurter/
├── powerbi/
└── docs/

## Development Workflow

The project follows a Git-based development workflow.

- `main` — stable and portfolio-ready branch
- `develop` — integration and testing branch
- Feature branches can be created from `develop` for future development
- Pull Requests are used to merge changes into `main`
- GitHub Actions validates the repository structure on changes to `main`
