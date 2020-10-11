CREATE TABLE [dwh].[dim_time] (
    [id_time] INT      IDENTITY (1, 1) NOT NULL,
    [time]    TIME (7) NOT NULL,
    [hour]    TINYINT  NOT NULL,
    [minute]  TINYINT  NOT NULL,
    [second]  TINYINT  NOT NULL,
    PRIMARY KEY CLUSTERED ([id_time] ASC)
);

