
CREATE PROCEDURE [dwh].[load_fact_trade_incre]
AS
	BEGIN TRANSACTION T1
		BEGIN TRY
			EXEC [dwh].[load_fact_trades_bitmex] @mode = 'incre'
			EXEC [dwh].[load_fact_trades_coinbase] @mode = 'incre'
		END TRY

		BEGIN CATCH
			IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
		END CATCH
	COMMIT TRAN T1
