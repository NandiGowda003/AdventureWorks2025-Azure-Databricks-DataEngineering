CREATE TABLE dbo.ETL_Metadata
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(128) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1
);
GO

INSERT INTO dbo.ETL_Metadata (TableName)
VALUES
('DimProduct'),
('DimCustomer'),
('DimDate'),
('DimGeography'),
('FactInternetSales');
GO

-- parameterization in lookup table (ADF pipeline)
SELECT TableName
FROM dbo.ETL_Metadata
WHERE IsActive = 1
ORDER BY ID;
