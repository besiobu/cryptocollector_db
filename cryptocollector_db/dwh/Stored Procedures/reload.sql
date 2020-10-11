
CREATE PROCEDURE [dwh].[reload]
AS

-- Drop and recreate tables
EXEC [dwh].[create_dim_exchange]
EXEC [dwh].[create_dim_currency]
EXEC [dwh].[create_dim_date]
EXEC [dwh].[create_dim_time]
EXEC [dwh].[create_fact_trade]

-- Reload dimension tables
EXEC [dwh].[load_dim_exchange]
EXEC [dwh].[load_dim_currency]
EXEC [dwh].[load_dim_date]
EXEC [dwh].[load_dim_time]

-- Reload fact table
EXEC [dwh].[load_fact_trade_full]

