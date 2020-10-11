

CREATE FUNCTION [staging].[timestamp_to_utc](
	@timestamp DATETIME2
)
RETURNS DATETIME2
AS 
BEGIN
RETURN(CONVERT(DATETIME2, @timestamp) AT TIME ZONE 'Central European Standard Time' AT TIME ZONE 'UTC')
END		
