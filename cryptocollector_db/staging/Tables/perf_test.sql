CREATE TABLE [staging].[perf_test] (
    [insert_no]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [timestamp_script] VARCHAR (MAX) NOT NULL,
    [timestamp_db]     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [user]             VARCHAR (MAX) DEFAULT (suser_name()) NOT NULL,
    [text1]            VARCHAR (MAX) NULL,
    [text2]            VARCHAR (MAX) NULL,
    [text3]            VARCHAR (MAX) NULL,
    [text4]            VARCHAR (MAX) NULL,
    [text5]            VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([insert_no] ASC)
);

