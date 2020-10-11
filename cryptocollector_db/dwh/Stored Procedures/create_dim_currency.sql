




CREATE PROCEDURE [dwh].[create_dim_currency]
AS 

DROP TABLE IF EXISTS [dwh].[dim_currency]

CREATE TABLE [dwh].[dim_currency]
(
	[id_currency] INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[id_exchange] INT NOT NULL
	,[currency] VARCHAR(25) NOT NULL
	,[base_currency] VARCHAR(25) NOT NULL
	,[quote_currency] VARCHAR(25) NOT NULL
)

