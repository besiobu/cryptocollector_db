CREATE TABLE [staging].[bitmex] (
    [insert_no]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [timestamp_script] VARCHAR (MAX) NULL,
    [timestamp_db]     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [user]             VARCHAR (MAX) DEFAULT (suser_name()) NOT NULL,
    [timestamp]        VARCHAR (MAX) NULL,
    [symbol]           VARCHAR (MAX) NULL,
    [side]             VARCHAR (MAX) NULL,
    [size]             VARCHAR (MAX) NULL,
    [price]            VARCHAR (MAX) NULL,
    [tickDirection]    VARCHAR (MAX) NULL,
    [trdMatchID]       VARCHAR (MAX) NULL,
    [grossValue]       VARCHAR (MAX) NULL,
    [homeNotional]     VARCHAR (MAX) NULL,
    [foreignNotional]  VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([insert_no] ASC)
);

