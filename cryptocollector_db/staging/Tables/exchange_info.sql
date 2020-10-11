CREATE TABLE [staging].[exchange_info] (
    [id_exchange]    INT          IDENTITY (1, 1) NOT NULL,
    [name]           VARCHAR (25) NOT NULL,
    [currency]       VARCHAR (25) NOT NULL,
    [base_currency]  VARCHAR (25) NOT NULL,
    [quote_currency] VARCHAR (25) NOT NULL,
    CONSTRAINT [pk_exchange] PRIMARY KEY CLUSTERED ([id_exchange] ASC),
    CONSTRAINT [unique_ccy] UNIQUE NONCLUSTERED ([name] ASC, [currency] ASC)
);

