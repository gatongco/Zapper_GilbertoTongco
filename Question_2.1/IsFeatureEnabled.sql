USE [Zapper]
GO

/****** Object:  UserDefinedFunction [dbo].[IsFeatureEnabled]    Script Date: 26/09/2024 3:12:51 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[IsFeatureEnabled]
(
    @Settings NVARCHAR(8),
    @FeatureIndex INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;

    -- Validate input
    IF LEN(@Settings) <> 8 OR @FeatureIndex < 1 OR @FeatureIndex > 8
    BEGIN
        RETURN NULL; -- Invalid input
    END

    -- Check if the feature is enabled (1) or disabled (0)
    IF SUBSTRING(@Settings, @FeatureIndex, 1) = '1'
    BEGIN
        SET @Result = 1; -- Feature is enabled
    END
    ELSE
    BEGIN
        SET @Result = 0; -- Feature is disabled
    END

    RETURN @Result;
END;

GO

