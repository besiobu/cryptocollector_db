









CREATE PROCEDURE [dwh].[load_fact_trades_bitmex] @mode VARCHAR(5)
AS
DECLARE @insert_number BIGINT

IF @mode = 'full'
	SET @insert_number = 0
ELSE
	SELECT @insert_number = [dwh].[get_last_insert_by_exchange]('Bitmex')

INSERT INTO [dwh].[fact_trade]
SELECT
	[D].[id_date]	AS [id_date_utc]
	,[T].[id_time]	AS [id_time_utc]
	,[time_utc_ms]
	,[delay_script_ms]
	,[delay_db_ms]
	,[insert_no]
	,[DC].[id_currency]
	,[DE].[id_exchange]
	,[price]
	,[volume]
	,[side]
FROM(SELECT
	TIMEFROMPARTS(DATEPART(HOUR,	[staging].[timestamp_to_utc]([timestamp_script])), 
				   DATEPART(MINUTE, [staging].[timestamp_to_utc]([timestamp_script])), 
				   DATEPART(SECOND, [staging].[timestamp_to_utc]([timestamp_script])), 0, 0)	AS [time_utc]
	,CONVERT(DATE, [staging].[timestamp_to_utc]([timestamp_script]))							AS [date_utc]	
	,DATEPART(MILLISECOND, [staging].[timestamp_to_utc]([timestamp_script]))					AS [time_utc_ms]
	,SUBSTRING([symbol], 0, 4)			AS [base_currency]
	,SUBSTRING([symbol], 4, 5)			AS [quote_currency]
	,DATEDIFF(MILLISECOND, 
			  CONVERT(DATETIME2, [timestamp]),
			  [staging].[timestamp_to_utc]([timestamp_script]))			AS [delay_script_ms]
		,DATEDIFF(MILLISECOND, 
				  [staging].[timestamp_to_utc]([timestamp_script]),
				  [staging].[timestamp_to_utc]([timestamp_db]))			AS [delay_db_ms]
	,[insert_no]						AS [insert_no]
	,[symbol]							AS [currency]
	,CONVERT(DECIMAL(19,6), [price])	AS [price]
	,CONVERT(DECIMAL(19,6), [size])		AS [volume]
	,'Bitmex'							AS [exchange]
	,CASE [tickDirection]
		WHEN 'ZeroMinusTick'	THEN 0
		WHEN 'MinusTick'		THEN 1
		WHEN 'PlusTick'			THEN 2
		WHEN 'ZeroPlusTick'		THEN 3
		END								AS [side]
	FROM
	[staging].[bitmex]
	WHERE
		[insert_no] > @insert_number)
											AS BM
	INNER JOIN [dwh].[dim_exchange]			AS DE		ON	[BM].[exchange]		= [DE].[name]
	INNER JOIN [dwh].[dim_currency]			AS DC		ON	[BM].[currency]		= [DC].[currency]
	INNER JOIN [dwh].[dim_date]				AS D		ON	[BM].[date_utc]		= [D].[date]
	INNER JOIN [dwh].[dim_time]				AS T		ON	[BM].[time_utc]		= [T].[time]
