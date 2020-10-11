CREATE TABLE [dwh].[dim_exchange] (
    [id_exchange] INT          IDENTITY (1, 1) NOT NULL,
    [name]        VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_exchange] ASC)
);

