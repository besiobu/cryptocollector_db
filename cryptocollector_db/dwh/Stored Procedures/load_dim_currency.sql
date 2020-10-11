



CREATE PROCEDURE [dwh].[load_dim_currency]
AS 

INSERT INTO [dwh].[dim_currency]
SELECT
	[DE].[id_exchange]
	,[currency]
	,[base_currency]
	,[quote_currency]
FROM
	[staging].[exchange_info] AS EI 
	INNER JOIN[dwh].[dim_exchange] AS DE ON [EI].[name] = [DE].[name]

