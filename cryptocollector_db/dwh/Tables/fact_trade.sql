CREATE TABLE [dwh].[fact_trade] (
    [id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_date_utc]     INT             NOT NULL,
    [id_time_utc]     INT             NOT NULL,
    [time_utc_ms]     SMALLINT        NOT NULL,
    [delay_script_ms] INT             NOT NULL,
    [delay_db_ms]     INT             NOT NULL,
    [insert_no]       BIGINT          NOT NULL,
    [id_currency]     TINYINT         NOT NULL,
    [id_exchange]     TINYINT         NOT NULL,
    [price]           DECIMAL (19, 6) NOT NULL,
    [volume]          DECIMAL (19, 6) NOT NULL,
    [side]            TINYINT         NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [unique_trades] UNIQUE NONCLUSTERED ([insert_no] ASC, [id_exchange] ASC)
);

