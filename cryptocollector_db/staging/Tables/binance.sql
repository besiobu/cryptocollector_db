CREATE TABLE [staging].[binance] (
    [insert_no] BIGINT        IDENTITY (1, 1) NOT NULL,
    [timestamp] DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [user]      VARCHAR (MAX) DEFAULT (suser_name()) NOT NULL,
    [e]         VARCHAR (MAX) NULL,
    [ee]        VARCHAR (MAX) NULL,
    [s]         VARCHAR (MAX) NULL,
    [t]         VARCHAR (MAX) NULL,
    [p]         VARCHAR (MAX) NULL,
    [q]         VARCHAR (MAX) NULL,
    [b]         VARCHAR (MAX) NULL,
    [a]         VARCHAR (MAX) NULL,
    [tt]        VARCHAR (MAX) NULL,
    [m]         VARCHAR (MAX) NULL,
    [mm]        VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([insert_no] ASC)
);

