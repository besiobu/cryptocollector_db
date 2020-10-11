CREATE TABLE [staging].[coinbase] (
    [insert_no]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [timestamp_script] VARCHAR (MAX) NOT NULL,
    [timestamp_db]     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [user]             VARCHAR (MAX) DEFAULT (suser_name()) NOT NULL,
    [type]             VARCHAR (MAX) NULL,
    [trade_id]         VARCHAR (MAX) NULL,
    [sequence]         VARCHAR (MAX) NULL,
    [maker_order_id]   VARCHAR (MAX) NULL,
    [taker_order_id]   VARCHAR (MAX) NULL,
    [time]             VARCHAR (MAX) NULL,
    [product_id]       VARCHAR (MAX) NULL,
    [size]             VARCHAR (MAX) NULL,
    [price]            VARCHAR (MAX) NULL,
    [side]             VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([insert_no] ASC)
);

