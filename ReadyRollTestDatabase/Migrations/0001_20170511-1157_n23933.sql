-- <Migration ID="598a81d0-969c-4233-be80-1e35e3da7acd" />
GO

PRINT N'Creating [dbo].[Sted]...';


GO
CREATE TABLE [dbo].[Sted] (
    [Id]       INT            NOT NULL,
    [Navn]     NVARCHAR (MAX) NULL,
    [RegionId] NVARCHAR (50)  NULL,
    [Kilde]    TINYINT        NOT NULL,
    CONSTRAINT [PK_Sted] PRIMARY KEY CLUSTERED ([Id] ASC)
);

