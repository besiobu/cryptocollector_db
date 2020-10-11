
CREATE PROCEDURE [dwh].[load_fact_trade_full]
AS
	EXEC [dwh].[load_fact_trades_bitmex] @mode = 'full'
	EXEC [dwh].[load_fact_trades_coinbase] @mode = 'full'
