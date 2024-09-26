USE [Zapper]
GO

/****** Object:  StoredProcedure [dbo].[ReadSettingsFromFile]    Script Date: 26/09/2024 3:14:39 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReadSettingsFromFile]
(
    @FilePath NVARCHAR(255),
    @Settings NVARCHAR(8) OUTPUT
)
AS
BEGIN
    DECLARE @Command NVARCHAR(1000);
    DECLARE @SettingsByte TINYINT;

    SET @Command = 'type ' + @FilePath;
    CREATE TABLE #FileContent (Line NVARCHAR(255));
    INSERT INTO #FileContent EXEC xp_cmdshell @Command;

    SELECT TOP 1 @SettingsByte = CAST(Line AS TINYINT) FROM #FileContent WHERE Line IS NOT NULL;
    DROP TABLE #FileContent;

    SET @Settings = dbo.ByteToSettingsString(@SettingsByte);
END;

GO

