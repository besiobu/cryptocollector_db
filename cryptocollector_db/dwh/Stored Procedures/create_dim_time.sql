




CREATE PROCEDURE [dwh].[create_dim_time]
AS

DROP TABLE IF EXISTS [dwh].[dim_time]

CREATE TABLE [dwh].[dim_time]
(
	[id_time]	INT		NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[time]		TIME	NOT NULL
	,[hour]		TINYINT NOT NULL
	,[minute]	TINYINT NOT NULL
	,[second]	TINYINT NOT NULL
)

