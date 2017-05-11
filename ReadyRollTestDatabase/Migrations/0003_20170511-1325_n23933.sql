-- <Migration ID="c220b49d-62e0-4c21-b99f-f93e3df63626" />
GO


GO
PRINT N'Altering [dbo].[Sted]...';


GO
ALTER TABLE [dbo].[Sted]
    ADD [Status] TINYINT NULL;


GO

