-- <Migration ID="6b80402d-13cd-45a7-bd69-860b29cbeeb5" />
GO


GO
PRINT N'Altering [dbo].[Sted]...';


GO
ALTER TABLE [dbo].[Sted]
    ADD [Status] TINYINT NULL;


GO

