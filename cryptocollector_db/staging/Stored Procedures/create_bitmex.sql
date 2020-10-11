


CREATE PROCEDURE [staging].[create_bitmex]
AS

DROP TABLE IF EXISTS [staging].[bitmex]

CREATE TABLE [staging].[bitmex]
(
	[insert_no]			BIGINT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	[timestamp_script]	VARCHAR(MAX),
	[timestamp_db]		DATETIME2				NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[user]				VARCHAR(MAX)            NOT NULL DEFAULT SUSER_NAME(),
	[timestamp]			VARCHAR(MAX),
	[symbol]			VARCHAR(MAX),
	[side]				VARCHAR(MAX),
	[size]				VARCHAR(MAX),
	[price]				VARCHAR(MAX),
	[tickDirection]		VARCHAR(MAX),
	[trdMatchID]		VARCHAR(MAX),
	[grossValue]		VARCHAR(MAX),
	[homeNotional]		VARCHAR(MAX),
	[foreignNotional]	VARCHAR(MAX),
);
