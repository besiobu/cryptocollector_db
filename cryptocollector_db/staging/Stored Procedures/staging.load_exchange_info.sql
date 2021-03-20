USE [crypto_dev]
GO

INSERT INTO [staging].[exchange_info]
           ([name]
           ,[currency]
           ,[base_currency]
           ,[quote_currency])
     VALUES
           --(<name, varchar(25),> ,<currency, varchar(25),> ,<base_currency, varchar(25),> ,<quote_currency, varchar(25),>)
		   ('Coinbase', 'BTC-USD', 'BTC', 'USD'),
		   ('Coinbase', 'BTC-EUR', 'BTC', 'EUR'),
		   ('Coinbase', 'BTC-GBP', 'BTC', 'GBP'),

		   ('Coinbase', 'LTC-USD', 'LTC', 'USD'),
		   ('Coinbase', 'LTC-EUR', 'LTC', 'EUR'),
		   ('Coinbase', 'LTC-GBP', 'LTC', 'GBP'),

		   ('Coinbase', 'ETH-USD', 'ETH', 'USD'),
		   ('Coinbase', 'ETH-EUR', 'ETH', 'EUR'),
		   ('Coinbase', 'ETH-GBP', 'ETH', 'GBP'),

		   ('Coinbase', 'ETH-BTC', 'ETH', 'BTC'),
		   ('Coinbase', 'LTC-BTC', 'LTC', 'BTC'),
		   
		   ('Bitmex', 'XBTUSD', 'BTC', 'USD'),
		   ('Bitmex', 'LTCUSD', 'LTC', 'USD'),
		   ('Bitmex', 'ETHUSD', 'ETH', 'USD')

GO


