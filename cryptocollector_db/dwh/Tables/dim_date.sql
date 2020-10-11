CREATE TABLE [dwh].[dim_date] (
    [id_date]      INT          IDENTITY (1, 1) NOT NULL,
    [date]         DATE         NOT NULL,
    [day]          SMALLINT     NOT NULL,
    [day_name]     VARCHAR (15) NOT NULL,
    [day_of_week]  TINYINT      NOT NULL,
    [day_of_year]  SMALLINT     NOT NULL,
    [week_of_year] TINYINT      NOT NULL,
    [month]        TINYINT      NOT NULL,
    [month_name]   VARCHAR (15) NOT NULL,
    [quarter]      TINYINT      NOT NULL,
    [year]         SMALLINT     NOT NULL,
    PRIMARY KEY CLUSTERED ([id_date] ASC)
);

