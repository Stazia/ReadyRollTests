-- <Migration ID="7db1dbb1-d264-45ef-977c-b2a5d580eb58" />
GO


GO
PRINT N'Altering [dbo].[Sted]...';


GO
ALTER TABLE [dbo].[Sted]
    ADD [KategoriId] NVARCHAR (50) NULL;


GO

