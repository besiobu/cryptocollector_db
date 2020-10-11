



CREATE PROCEDURE [staging].[create_perf_test]
AS

DROP TABLE IF EXISTS [staging].[perf_test]

CREATE TABLE [staging].[perf_test]
(
	[insert_no]			BIGINT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	[timestamp_script]	VARCHAR(MAX)			NOT NULL,
	[timestamp_db]		DATETIME2				NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[user]				VARCHAR(MAX)            NOT NULL DEFAULT SUSER_NAME(),
	[text1]				VARCHAR(MAX),
	[text2]				VARCHAR(MAX),
	[text3]				VARCHAR(MAX),
	[text4]				VARCHAR(MAX),
	[text5]				VARCHAR(MAX)
);
