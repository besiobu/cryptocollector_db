


CREATE PROCEDURE [dwh].[create_fact_trade]
AS

DROP TABLE IF EXISTS [dwh].[fact_trade]

CREATE TABLE [dwh].[fact_trade](
	[id]				[bigint]	IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_date_utc]		[int]		NOT NULL,
	[id_time_utc]		[int]		NOT NULL,
	[time_utc_ms]		[smallint]	NOT NULL,
	[delay_script_ms]	[int]		NOT NULL,
	[delay_db_ms]		[int]		NOT NULL,
	[insert_no]			[bigint]	NOT NULL,
	[id_currency]		[tinyint]	NOT NULL,
	[id_exchange]		[tinyint]	NOT NULL,
	[price]				[decimal](19, 6) NOT NULL,
	[volume]			[decimal](19, 6) NOT NULL,
	[side]				[tinyint] NOT NULL
)

ALTER TABLE [dwh].[fact_trade]
  ADD CONSTRAINT [unique_trades] UNIQUE([insert_no], [id_exchange]);

