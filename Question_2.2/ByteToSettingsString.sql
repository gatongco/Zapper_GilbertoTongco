USE [Zapper]
GO

/****** Object:  UserDefinedFunction [dbo].[ByteToSettingsString]    Script Date: 26/09/2024 3:15:11 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ByteToSettingsString]
(
    @SettingsByte TINYINT
)
RETURNS NVARCHAR(8)
AS
BEGIN
    DECLARE @Result NVARCHAR(8) = '';
    DECLARE @Index INT = 7;

    WHILE @Index >= 0
    BEGIN
        SET @Result = @Result + CAST((@SettingsByte >> @Index) & 1 AS NVARCHAR(1));
        SET @Index = @Index - 1;
    END

    RETURN @Result;
END;

GO

