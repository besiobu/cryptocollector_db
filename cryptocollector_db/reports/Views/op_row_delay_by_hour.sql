
CREATE VIEW [reports].[op_row_delay_by_hour]
AS
SELECT
	DATETIMEFROMPARTS(DATEPART(YEAR, [TS].[date]), 
					  DATEPART(MONTH, [TS].[date]), 
					  DATEPART(DAY, [TS].[date]), 
					  [TS].[hour], 0, 0, 0)		AS [timestamp_utc]
	,[TS].[exchange]							AS [exchange]
	,CASE 
		WHEN [delay_script] IS NULL THEN 0
		ELSE [delay_script]
	END											AS [delay_script]
FROM
	(SELECT
		[D].[date]	AS [date]
		,[H].[hour] AS [hour]
		,[E].[name] AS [exchange]
	FROM 
		[dwh].[dim_date] AS [D]
	CROSS JOIN
		(SELECT DISTINCT [hour] FROM [dwh].[dim_time]) AS [H]
	CROSS JOIN
		(SELECT DISTINCT [name] FROM [dwh].[dim_exchange]) AS [E]
	WHERE
			DATEDIFF(DAY,  D.[date], GETDATE()) >= 0
		AND DATEDIFF(DAY,  D.[date], GETDATE()) <= 30)
	AS [TS]
LEFT JOIN
	(SELECT
		[date]							AS [date]
		,[hour]							AS [hour]
		,[DE].[name]					AS [exchange]
		,AVG([FT].[delay_db_ms])	AS [delay_script]
	FROM 
		[crypto_dev].[dwh].[fact_trade]		AS	[FT]
		INNER JOIN [dwh].[dim_exchange]     AS  [DE]	ON [FT].[id_exchange]	= [DE].[id_exchange]
		INNER JOIN [dwh].[dim_currency]		AS  [DC]	ON [FT].[id_currency]	= [DC].[id_currency]
		INNER JOIN [dwh].[dim_date]			AS	[D]		ON [FT].[id_date_utc]	= [D].[id_date]
		INNER JOIN [dwh].[dim_time]			AS	[T]		ON [FT].[id_time_utc]	= [T].[id_time]
	GROUP BY
		[DE].[name]
		,[date]
		,[hour]) AS C
ON [TS].[date] = [C].[date] AND [TS].[hour] = [C].[hour] AND [C].[exchange] = [TS].[exchange]
