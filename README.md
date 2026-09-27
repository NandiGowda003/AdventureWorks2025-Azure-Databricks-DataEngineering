# AdventureWorks 2025 — Azure Data Engineering Project

## Project Overview

An end-to-end data engineering project built using Azure Data Factory, Azure Data Lake Storage Gen2, Azure Databricks, SQL Server, REST API, GitHub, and Power BI.

The project demonstrates Medallion Architecture, metadata-driven ingestion, data transformation, SCD Type 2, analytics, orchestration, and CI validation.

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

AdventureWorksDW2025:

- DimCustomer
- DimProduct
- DimDate
- DimGeography
- FactInternetSales

### REST API

Frankfurter API provides external currency exchange-rate data.

## Medallion Architecture

### Bronze

Azure Data Factory ingests:

- SQL Server data using a metadata-driven pipeline
- REST API data through a separate API pipeline

### Silver

Azure Databricks and PySpark perform:

- Data cleansing
- Data type standardization
- Null handling
- Column selection
- Business transformations
- API transformation

### Gold

Business-ready datasets:

- DimCustomer
- DimProduct
- DimDate
- DimGeography
- FactInternetSales
- Frankfurter exchange-rate data

## SCD Type 2

SCD Type 2 metadata is implemented for:

- DimCustomer
- DimProduct
- DimGeography

Columns include:

- EffectiveStartDate
- EffectiveEndDate
- IsCurrent

## Analytics

Business metrics include:

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

The Gold layer is consumed by Power BI.

Dashboard includes:

- Total Sales
- Total Orders
- Total Quantity
- Average Order Value
- Sales Trend by Year
- Sales by Product Line
- Top 10 Products
- Top 10 Customers
- Top 10 Cities
- Sales by State/Province
- Sales by Month

Filters:

- Year
- Product Line
- Country
- State/Province

## Orchestration

### Azure Data Factory

- Metadata-driven SQL ingestion pipeline
- REST API ingestion pipeline
- Daily SQL Bronze schedule trigger
- API pipeline remains manually triggered

### Azure Databricks

Job:

`JOB_AdventureWorks2025_Pipeline`

Tasks:

`Silver_Layer → Gold_Layer`

Gold execution depends on successful completion of Silver.

The Databricks job is currently configured for manual execution.

## Data Validation

Validation includes:

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

## Key Project Highlights

- Metadata-driven SQL ingestion using Azure Data Factory
- REST API ingestion using Azure Data Factory
- Azure Data Lake Storage Gen2 Medallion Architecture
- PySpark-based Silver and Gold transformations
- SCD Type 2 implementation for selected dimensions
- Databricks Job orchestration for Silver → Gold processing
- Daily scheduled SQL Bronze ingestion
- Power BI dimensional model and interactive dashboard
- Git-based development using `main` and `develop`
- GitHub Actions CI validation

## Repository Structure

```text
AdventureWorks2025-Azure-Databricks-DataEngineering/
├── .github/
│   └── workflows/
├── api/
│   └── frankfurter/
├── databricks/
├── dataset/
├── docs/
├── factory/
├── integrationRuntime/
├── linkedService/
├── pipeline/
├── powerbi/
├── sql/
└── trigger/
```

ADF artifacts are managed through Azure Data Factory Git integration.

## Development Workflow
* main — stable and portfolio
* develop — integration and testing
* Pull Requests are used to merge changes into main
* GitHub Actions validates repository structure
* Azure Data Factory uses Git-based development and publishing

## CI/CD

GitHub Actions is used to validate the project repository.

### Workflow

- Changes are developed in the `develop` branch
- Pull Requests are used to merge changes into `main`
- GitHub Actions runs automatically on changes to `main`
- CI validates the required project structure and key files
- Successful validation ensures the repository is ready for deployment

### CI Validation

The workflow validates:

- Required project folders
- README.md
- ADF project structure
- SQL metadata
- API documentation
- Power BI documentation

The CI workflow is defined in:

`.github/workflows/ci.yml`

Project Status

Core ingestion, Silver and Gold transformations, SCD Type 2, Databricks orchestration, Power BI dashboard, ADF scheduling, Git workflow, and CI validation completed.

