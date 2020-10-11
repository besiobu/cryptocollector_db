


CREATE PROCEDURE [dwh].[load_dim_time]
AS

DECLARE @start TIME = TIMEFROMPARTS(0, 0, 0, 0, 0) 
DECLARE @t TIME = @start
DECLARE @i BIGINT = 0

WHILE @t < TIMEFROMPARTS(23, 59, 59, 0, 0) 
BEGIN
	SET @t =  DATEADD(SECOND, @i, @start)
	INSERT INTO [dwh].[dim_time]
			   ([time], [hour], [minute], [second])
		 VALUES
			   (@t, DATEPART(HOUR, @t), DATEPART(MINUTE, @t), DATEPART(SECOND, @t))
	SET @i = @i + 1
END

