




CREATE PROCEDURE [dwh].[load_fact_trades_coinbase] @mode VARCHAR(5)
AS
DECLARE @insert_number BIGINT

IF @mode = 'full'
	SET @insert_number = 0
ELSE
	SELECT @insert_number = [dwh].[get_last_insert_by_exchange]('Coinbase')

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
		,SUBSTRING([product_id], 0, CHARINDEX('-', [product_id], 0))						AS [base_ccy]
		,SUBSTRING([product_id], CHARINDEX('-', [product_id], 0) + 1,  LEN([product_id]))	AS [quote_ccy]
		,DATEDIFF(MILLISECOND, 
				  CONVERT(DATETIME2, [time]),
				  [staging].[timestamp_to_utc]([timestamp_script]))			AS [delay_script_ms]
		,DATEDIFF(MILLISECOND, 
				  [staging].[timestamp_to_utc]([timestamp_script]),
				  [staging].[timestamp_to_utc]([timestamp_db]))			AS [delay_db_ms]

		,[insert_no]												AS [insert_no]
		,[product_id]												AS currency 
		,CONVERT(DECIMAL(19,6), [price])	AS [price]
		,CONVERT(DECIMAL(19,6), [size])		AS [volume]
		,[sequence]							AS [sequence]
		,CASE side
			WHEN 'sell' THEN 0
			WHEN 'buy'  THEN 1
			END								AS [side]
		,'Coinbase'							AS [exchange]
FROM 
		[staging].[coinbase] WITH (NOLOCK)
WHERE
		[insert_no] > @insert_number)
											AS CB 
	INNER JOIN [dwh].[dim_exchange]			AS DE		ON	[CB].[exchange]			= [DE].[name]
	INNER JOIN [dwh].[dim_currency]			AS DC		ON	[CB].[currency]			= [DC].[currency]
	INNER JOIN [dwh].[dim_date]				AS D		ON	[CB].[date_utc]		= [D].[date]
	INNER JOIN [dwh].[dim_time]				AS T		ON	[CB].[time_utc]		= [T].[time]
