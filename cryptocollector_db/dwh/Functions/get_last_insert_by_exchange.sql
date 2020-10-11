CREATE FUNCTION [dwh].[get_last_insert_by_exchange](
	@exchange VARCHAR(25)
)
RETURNS BIGINT
AS 
BEGIN
RETURN(SELECT TOP(1)
		[insert_no]
	FROM
		[dwh].[fact_trade] AS FC
		INNER JOIN [dwh].[dim_exchange] AS DE ON [FC].[id_exchange] = [DE].[id_exchange]
	WHERE
		[DE].[name] = @exchange
	ORDER BY
		[insert_no] DESC)
END		