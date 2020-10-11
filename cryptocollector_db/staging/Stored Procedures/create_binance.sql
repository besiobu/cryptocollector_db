
CREATE PROCEDURE [staging].[create_binance]
AS

DROP TABLE IF EXISTS [staging].[binance]

CREATE TABLE [staging].[binance]
(
	[insert_no]				BIGINT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	[timestamp]			DATETIME2				NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[user]				VARCHAR(MAX)            NOT NULL DEFAULT SUSER_NAME(),
	[e] VARCHAR(MAX),
	[ee] VARCHAR(MAX),
	[s] VARCHAR(MAX),
	[t] VARCHAR(MAX),
	[p] VARCHAR(MAX),
	[q] VARCHAR(MAX),
	[b] VARCHAR(MAX),
	[a] VARCHAR(MAX),
	[tt] VARCHAR(MAX),
	[m] VARCHAR(MAX),
	[mm] VARCHAR(MAX)
);
