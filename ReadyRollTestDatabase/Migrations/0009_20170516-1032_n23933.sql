-- <Migration ID="6eb1839b-869b-48e8-96e0-bcda97b4674e" />
GO


GO
PRINT N'Rename [dbo].[Sted].[Kilde] to KildeA';


GO
EXECUTE sp_rename @objname = N'[dbo].[Sted].[Kilde]', @newname = N'KildeA', @objtype = N'COLUMN';


GO

