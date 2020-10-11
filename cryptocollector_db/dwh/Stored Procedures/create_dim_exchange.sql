


CREATE PROCEDURE [dwh].[create_dim_exchange]
AS 

DROP TABLE IF EXISTS [dwh].[dim_exchange]

CREATE TABLE [dwh].[dim_exchange]
(
	[id_exchange]	INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	,[name]			VARCHAR(25) NOT NULL
)

