-- <Migration ID="82300ea7-f6bc-4c12-ba7f-4f40898a5755" />
GO


GO
PRINT N'Altering [dbo].[Sted]...';


GO
ALTER TABLE [dbo].[Sted]
    ADD [Lastmodified] DATETIME NULL;


GO

