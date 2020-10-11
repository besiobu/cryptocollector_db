CREATE TABLE [dwh].[dim_currency] (
    [id_currency]    INT          IDENTITY (1, 1) NOT NULL,
    [id_exchange]    INT          NOT NULL,
    [currency]       VARCHAR (25) NOT NULL,
    [base_currency]  VARCHAR (25) NOT NULL,
    [quote_currency] VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_currency] ASC)
);

