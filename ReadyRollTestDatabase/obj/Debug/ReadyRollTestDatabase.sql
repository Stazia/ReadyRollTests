﻿/*
	Target database:	ReadyRollTestDatabase
	Target instance:	NRKDT59991\LOCALDB#98A2BBC6
	Generated date:		12.05.2017 11:39:52
	Generated on:		NRKDT59991
	Package version:	(undefined)
	Migration version:	(n/a)
	Baseline version:	(n/a)
	ReadyRoll version:	1.13.23.3401
	Migrations pending:	1

	IMPORTANT! "SQLCMD Mode" must be activated prior to execution (under the Query menu in SSMS).

	BEFORE EXECUTING THIS SCRIPT, WE STRONGLY RECOMMEND YOU TAKE A BACKUP OF YOUR DATABASE.

	This SQLCMD script is designed to be executed through MSBuild (via the .sqlproj Deploy target) however 
	it can also be run manually using SQL Management Studio. 

	It was generated by the ReadyRoll build task and contains logic to deploy the database, ensuring that 
	each of the incremental migrations is executed a single time only in alphabetical (filename) 
	order. If any errors occur within those scripts, the deployment will be aborted and the transaction
	rolled-back.

	NOTE: Automatic transaction management is provided for incremental migrations, so you don't need to
		  add any special BEGIN TRAN/COMMIT/ROLLBACK logic in those script files. 
		  However if you require transaction handling in your Pre/Post-Deployment scripts, you will
		  need to add this logic to the source .sql files yourself.
*/

----====================================================================================================================
---- SQLCMD Variables

:setvar DatabaseName "ReadyRollTestDatabase"
:setvar ReleaseVersion ""
:setvar ForceDeployWithoutBaseline "False"
:setvar DeployPath "C:\NRK\Git\ReadyRollTests\ReadyRollTestDatabase\"
:setvar DefaultFilePrefix "ReadyRollTestDatabase"
:setvar DefaultDataPath "C:\Users\n23933\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\ProjectsV13\"
:setvar DefaultLogPath "C:\Users\n23933\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\ProjectsV13\"
:setvar DefaultBackupPath ""
----====================================================================================================================

:on error exit -- Instructs SQLCMD to abort execution as soon as an erroneous batch is encountered

:setvar PackageVersion "(undefined)"

GO

SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;
SET XACT_ABORT ON; -- Abort the current batch immediately if a statement raises a run-time error and rollback any open transaction(s)

IF N'$(DatabaseName)' = N'$' + N'(DatabaseName)' -- Is SQLCMD mode enabled within the execution context (eg. SSMS)
	BEGIN
		IF IS_SRVROLEMEMBER(N'sysadmin') = 1
			BEGIN -- User is sysadmin; abort execution by disconnect the script from the database server
				RAISERROR(N'This script must be run in SQLCMD Mode (under the Query menu in SSMS). Aborting connection to suppress subsequent errors.', 20, 127, N'UNKNOWN') WITH LOG;
			END
		ELSE
			BEGIN -- User is not sysadmin; abort execution by switching off statement execution (script will continue to the end without performing any actual deployment work)
				RAISERROR(N'This script must be run in SQLCMD Mode (under the Query menu in SSMS). Script execution has been halted.', 16, 127, N'UNKNOWN') WITH NOWAIT;
			END		
	END		
GO
IF @@ERROR != 0
	BEGIN
		SET NOEXEC ON; -- SQLCMD is NOT enabled so prevent any further statements from executing
	END
GO
-- Beyond this point, no further explicit error handling is required because it can be assumed that SQLCMD mode is enabled

-- As this script has been generated for a specific server instance/database combination, stop execution if there is a mismatch
IF (@@SERVERNAME != 'NRKDT59991\LOCALDB#98A2BBC6' OR '$(DatabaseName)' != 'ReadyRollTestDatabase')
BEGIN
	RAISERROR(N'This script should only be executed on the following server/instance: [NRKDT59991\LOCALDB#98A2BBC6] (Database: [ReadyRollTestDatabase]). Halting deployment.', 16, 127, N'UNKNOWN') WITH NOWAIT;
	RETURN;
END
GO







------------------------------------------------------------------------------------------------------------------------
------------------------------------------       PRE-DEPLOYMENT SCRIPTS       ------------------------------------------
------------------------------------------------------------------------------------------------------------------------

SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;

PRINT '----- executing pre-deployment script "Pre-Deployment\01_Create_Database.sql" -----';

------------------------- BEGIN PRE-DEPLOYMENT SCRIPT: "Pre-Deployment\01_Create_Database.sql" ---------------------------
GO
IF (DB_ID(N'$(DatabaseName)') IS NULL)
BEGIN
	PRINT N'Creating $(DatabaseName)...';
END
GO
IF (DB_ID(N'$(DatabaseName)') IS NULL)
BEGIN
	CREATE DATABASE [$(DatabaseName)]; -- MODIFY THIS STATEMENT TO SPECIFY A COLLATION FOR YOUR DATABASE
END

GO
-------------------------- END PRE-DEPLOYMENT SCRIPT: "Pre-Deployment\01_Create_Database.sql" ----------------------------









------------------------------------------------------------------------------------------------------------------------
------------------------------------------       INCREMENTAL MIGRATIONS       ------------------------------------------
------------------------------------------------------------------------------------------------------------------------

SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;

GO
PRINT '# Beginning transaction';

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

GO
IF DB_NAME() != '$(DatabaseName)'
  USE [$(DatabaseName)];

GO
SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;

GO
IF DB_NAME() != '$(DatabaseName)'
  USE [$(DatabaseName)];

GO
IF EXISTS (SELECT 1 FROM [$(DatabaseName)].[dbo].[__MigrationLogCurrent] WHERE [migration_id] = CAST ('6b80402d-13cd-45a7-bd69-860b29cbeeb5' AS UNIQUEIDENTIFIER))
  BEGIN
    IF @@TRANCOUNT > 0
      ROLLBACK;
    RAISERROR ('This script "Migrations\0005_20170512-1139_n23933.sql" has already been executed within the "$(DatabaseName)" database on this server. Halting deployment.', 16, 127);
    RETURN;
  END

GO
PRINT '

***** EXECUTING MIGRATION "Migrations\0005_20170512-1139_n23933.sql", ID: {6b80402d-13cd-45a7-bd69-860b29cbeeb5} *****';

GO


------------------------ BEGIN INCREMENTAL MIGRATION: "Migrations\0005_20170512-1139_n23933.sql" -------------------------
GO
-- <Migration ID="6b80402d-13cd-45a7-bd69-860b29cbeeb5" />
GO


GO
PRINT N'Altering [dbo].[Sted]...';


GO
ALTER TABLE [dbo].[Sted]
    ADD [Status] TINYINT NULL;


GO


------------------------- END INCREMENTAL MIGRATION: "Migrations\0005_20170512-1139_n23933.sql" --------------------------


GO
IF @@TRANCOUNT <> 1
  BEGIN
    DECLARE @ErrorMessage AS NVARCHAR (4000);
    SET @ErrorMessage = 'This migration "Migrations\0005_20170512-1139_n23933.sql" has left the transaction in an invalid or closed state (@@TRANCOUNT=' + CAST (@@TRANCOUNT AS NVARCHAR (10)) + '). Please ensure exactly 1 transaction is open by the end of the migration script.  Rolling-back any pending transactions.';
    RAISERROR (@ErrorMessage, 16, 127);
    RETURN;
  END

INSERT [$(DatabaseName)].[dbo].[__MigrationLog] ([migration_id], [script_checksum], [script_filename], [complete_dt], [applied_by], [deployed], [version], [package_version], [release_version])
VALUES                                         (CAST ('6b80402d-13cd-45a7-bd69-860b29cbeeb5' AS UNIQUEIDENTIFIER), '7289D6AF9819F1B071856142AA28C66D9567F9C70F3B825AFB6201E01DC5C831', '0005_20170512-1139_n23933.sql', SYSDATETIME(), SYSTEM_USER, 1, NULL, '$(PackageVersion)', CASE '$(ReleaseVersion)' WHEN '' THEN NULL ELSE '$(ReleaseVersion)' END);

PRINT '***** FINISHED EXECUTING MIGRATION "Migrations\0005_20170512-1139_n23933.sql", ID: {6b80402d-13cd-45a7-bd69-860b29cbeeb5} *****
';

GO
PRINT '# Committing transaction';

COMMIT TRANSACTION;

GO
PRINT '1 migration(s) deployed successfully';

GO

GO







------------------------------------------------------------------------------------------------------------------------
------------------------------------------       POST-DEPLOYMENT SCRIPTS      ------------------------------------------
------------------------------------------------------------------------------------------------------------------------


SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;

IF DB_NAME() != '$(DatabaseName)'
    USE [$(DatabaseName)];

PRINT '----- executing post-deployment script "Post-Deployment\01_Finalize_Deployment.sql" -----';

---------------------- BEGIN POST-DEPLOYMENT SCRIPT: "Post-Deployment\01_Finalize_Deployment.sql" ------------------------
GO
/*
Post-Deployment Script Template
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.
 Use SQLCMD syntax to include a file in the post-deployment script.
 Example:      :r .\myfile.sql
 Use SQLCMD syntax to reference a variable in the post-deployment script.
 Example:      :setvar TableName MyTable
               SELECT * FROM [$(TableName)]
--------------------------------------------------------------------------------------
*/

GO
----------------------- END POST-DEPLOYMENT SCRIPT: "Post-Deployment\01_Finalize_Deployment.sql" -------------------------






SET NOEXEC OFF; -- Resume statement execution if an error occurred within the script pre-amble
