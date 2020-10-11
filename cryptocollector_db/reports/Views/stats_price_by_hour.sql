


CREATE VIEW [reports].[stats_price_by_hour]
AS
SELECT 
	DATETIMEFROMPARTS(DATEPART(YEAR, [timestamp_utc]), 
					   DATEPART(MONTH, [timestamp_utc]), 
					   DATEPART(DAY, [timestamp_utc]), 
					   DATEPART(HOUR, [timestamp_utc]), 0, 0, 0) AS [timestamp_utc]
	,[exchange_name]
	,[currency]
	,AVG([price])	AS [avg_price]
	,SUM([volume])	AS [total_volume]
FROM
	(SELECT
		CONVERT(DATETIME2, CONCAT([date_utc], ' ', [time_utc])) AS [timestamp_utc]
		,CONCAT([base_currency], '-', [quote_currency]) AS [currency]
		,[exchange_name]
		,[price]
		,[volume]
	FROM
		[dwh].[fact_trade_view]) AS [D]
GROUP BY
	DATEPART(YEAR, [timestamp_utc])
	,DATEPART(MONTH, [timestamp_utc])
	,DATEPART(DAY, [timestamp_utc])
	,DATEPART(HOUR, [timestamp_utc])	
	,[exchange_name]
	,[currency]
