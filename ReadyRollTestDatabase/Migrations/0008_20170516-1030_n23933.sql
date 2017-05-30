-- <Migration ID="30db12f0-9b26-4e1f-9562-e70f310002e4" />
GO


GO
PRINT N'Rename [dbo].[Sted].[Kilde] to KildeA';


GO
EXECUTE sp_rename @objname = N'[dbo].[Sted].[Kilde]', @newname = N'KildeA', @objtype = N'COLUMN';


GO

