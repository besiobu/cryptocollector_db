


CREATE VIEW [dwh].[fact_trade_view]
AS
SELECT 
	[date_utc]			AS [date_utc]
	,[time_utc]			AS [time_utc]
	,[delay_script_ms]	AS [delay_script_ms]
	,[delay_db_ms]		AS [delay_db_ms]
	,[name]				AS [exchange_name]
	,[base_currency]	AS [base_currency]
	,[quote_currency]	AS [quote_currency]
	,[price]			AS [price]
	,[volume]			AS [volume]
	,[side]				AS [side]
FROM
	(SELECT
		[D].[date]											AS [date_utc]
		,DATEADD(MILLISECOND, [time_utc_ms], [T].[time])	AS [time_utc]
		,[delay_script_ms]
		,[delay_db_ms]
		,[DE].[name]
		,[DC].[base_currency]
		,[DC].[quote_currency]
		,[price]
		,[volume]
		,[side]
	FROM 
		[crypto_dev].[dwh].[fact_trade]	AS	[FT]
		INNER JOIN [dwh].[dim_date]			AS	[D]		ON [FT].[id_date_utc]	= [D].[id_date]
		INNER JOIN [dwh].[dim_time]			AS	[T]		ON [FT].[id_time_utc]	= [T].[id_time]
		INNER JOIN [dwh].[dim_exchange]     AS  [DE]	ON [FT].[id_exchange]	= [DE].[id_exchange]
		INNER JOIN [dwh].[dim_currency]		AS  [DC]	ON [FT].[id_currency]	= [DC].[id_currency]) AS TR
