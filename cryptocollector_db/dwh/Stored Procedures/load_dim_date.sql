CREATE PROCEDURE [dwh].[load_dim_date]
AS

DECLARE @start DATETIME = DATEFROMPARTS(2020, 1, 1) 
DECLARE @dt DATETIME = @start
DECLARE @i BIGINT = 0

WHILE @dt < DATEFROMPARTS(2022, 1, 1) 
BEGIN
	SET @dt =  DATEADD(DAY, @i, @start)
	INSERT INTO [dwh].[dim_date]
			   ([date], 
				[day], 
				[day_name], 
				[day_of_week], 
				[day_of_year],
				[week_of_year],
				[month],
				[month_name],
				[quarter],
				[year])
		 VALUES
			   (@dt, 
			   DATEPART(DAY, @dt), 
			   DATENAME(WEEKDAY, @dt), 
			   DATEPART(WEEKDAY, @dt), 
			   DATEPART(DAYOFYEAR, @dt),
			   DATEPART(ISO_WEEK, @dt),
			   DATEPART(MONTH, @dt),
			   DATENAME(MONTH, @dt),
			   DATEPART(QUARTER, @dt),
			   DATEPART(YEAR, @dt))
	SET @i = @i + 1
END

