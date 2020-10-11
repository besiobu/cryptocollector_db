


CREATE PROCEDURE [staging].[create_coinbase]
AS

DROP TABLE IF EXISTS [staging].[coinbase]

CREATE TABLE [staging].[coinbase]
(
	[insert_no]			BIGINT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	[timestamp_script]	VARCHAR(MAX)			NOT NULL,
	[timestamp_db]		DATETIME2				NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[user]				VARCHAR(MAX)            NOT NULL DEFAULT SUSER_NAME(),
	[type]				VARCHAR(MAX),
	[trade_id]			VARCHAR(MAX),
	[sequence]			VARCHAR(MAX),
	[maker_order_id]	VARCHAR(MAX),
	[taker_order_id]	VARCHAR(MAX),
	[time]				VARCHAR(MAX),
	[product_id]		VARCHAR(MAX),
	[size]				VARCHAR(MAX),
	[price]				VARCHAR(MAX),
	[side]				VARCHAR(MAX),
);
