CREATE PROCEDURE [staging].[delete_staging_bitmex] AS

DECLARE @insert_number BIGINT

SELECT @insert_number = [dwh].[get_last_insert_by_exchange]('Bitmex')

DELETE FROM 
	[staging].[bitmex]
WHERE 
		[insert_no] <= @insert_number - POWER(10, 5) 
	AND CONVERT(DATE, timestamp_script) < DATEADD(DAY, -7, GETDATE())