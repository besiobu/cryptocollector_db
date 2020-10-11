CREATE VIEW [reports].[op_row_count_all]
AS
SELECT
	[exchange_name]
	,CONCAT([base_currency], '-', [quote_currency]) AS [currency]
	,COUNT(*)										AS [n_trades]
FROM
	[dwh].[fact_trade_view]
GROUP BY
	[exchange_name]
	,CONCAT([base_currency], '-', [quote_currency])
	
