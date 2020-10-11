CREATE PROCEDURE [staging].[create_tables]
AS
	EXEC [staging].[create_binance]
	EXEC [staging].[create_bitmex]
	EXEC [staging].[create_coinbase]
