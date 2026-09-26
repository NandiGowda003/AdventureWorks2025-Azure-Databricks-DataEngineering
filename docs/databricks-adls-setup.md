# Databricks → ADLS Gen2 Setup

## 1. Databricks Workspace

Workspace:
`adb-adventureworks2025`

Region:
East US

Pricing:
Premium

Workspace type:
Serverless

## 2. Access Connector

Name:
`ac-adventureworks2025`

Authentication:
System-assigned managed identity

Role assigned on ADLS:
Storage Blob Data Contributor

## 3. Storage Credential

Name:
`cred-adventureworks-adls`

Type:
Azure Managed Identity

The credential uses the Access Connector managed identity.

## 4. External Location

Name:
`extloc-adventureworks-bronze`

Storage:
`adventureworkstorageadls`

Container:
`bronze`

Path:

`abfss://bronze@adventureworkstorageadls.dfs.core.windows.net/`

Credential:
`cred-adventureworks-adls`

## 5. Connection Validation

Read: Passed  
List: Passed  
Write: Passed  
Delete: Passed  
Path Exists: Passed  
Hierarchical Namespace: Passed

File Events are not required for the current project.

## 6. Bronze Structure

bronze/
├── AdventureWorks2025/
└── API/
