


CREATE PROCEDURE [dwh].[load_fact_trade_incre]
AS
	EXEC [dwh].[load_fact_trades_bitmex] @mode = 'incre'
	EXEC [dwh].[load_fact_trades_coinbase] @mode = 'incre'
