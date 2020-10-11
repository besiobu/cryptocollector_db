

CREATE PROCEDURE [dwh].[load_dim_exchange]
AS 

INSERT INTO [dwh].[dim_exchange]
SELECT DISTINCT
	[name]
FROM	
	[staging].[exchange_info]

