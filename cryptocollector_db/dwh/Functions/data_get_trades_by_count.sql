CREATE FUNCTION [dwh].[data_get_trades_by_count](
	@exchange_name VARCHAR(25),
	@base_currency VARCHAR(25),
	@quote_currency VARCHAR(25),
	@n_trades INT
)
RETURNS TABLE
AS 
RETURN
(SELECT TOP(@n_trades)
	[timestamp_utc]	AS [timestamp_utc]
	,[delay_db_ms]			AS [delay_ms]
	,[exchange_name]	AS [exchange_name]
	,[base_currency]	AS [base_currency]
	,[quote_currency]	AS [quote_currency]
	,[price]			AS [price]
	,[volume]			AS [volume]
	,[side]				AS [side]
FROM
	(SELECT
		CONVERT(DATETIME2, CONCAT([D].[date], ' ', DATEADD(MILLISECOND, [time_utc_ms], [T].[time]))) AS [timestamp_utc]
		,[delay_db_ms]
		,[DE].[name] AS [exchange_name]
		,[DC].[base_currency]
		,[DC].[quote_currency]
		,[price]
		,[volume]
		,[side]
	FROM 
		[crypto_dev].[dwh].[fact_trade]	AS	[FT]
		INNER JOIN [dwh].[dim_date]			AS	[D]		ON [FT].[id_date_utc]		= [D].[id_date]
		INNER JOIN [dwh].[dim_time]			AS	[T]		ON [FT].[id_time_utc]		= [T].[id_time]
		INNER JOIN [dwh].[dim_exchange]     AS  [DE]	ON [FT].[id_exchange]		= [DE].[id_exchange]
		INNER JOIN [dwh].[dim_currency]		AS  [DC]	ON [FT].[id_currency]		= [DC].[id_currency]) AS TR
WHERE 1=1
	AND [base_currency] = @base_currency
	AND [quote_currency] = @quote_currency
	AND [exchange_name] = @exchange_name
ORDER BY
	[timestamp_utc] DESC)
