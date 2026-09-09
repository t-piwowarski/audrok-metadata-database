/*
    File: 00_create_staging_tables.sql
    Layer: STAGING
    Purpose: create staging schema and integration tables

    Description:
    This script creates staging structures used for temporary
    integration, cleansing and standardization of raw AuDroK data
    before loading into the final normalized schema.

    Notes:
    - staging tables are fully reloadable
    - stores intermediate transformed data
    - acts as bridge between raw and final layer
*/

PRINT '========================================';
PRINT 'STAGING SETUP';
PRINT 'START';
PRINT '========================================';

IF NOT EXISTS (
	SELECT 1
	FROM sys.schemas
	WHERE name = 'stagging'
)

BEGIN
	EXEC('CREATE SCHEMA staging');
	PRINT 'Schema staging created';
END
ELSE
BEGIN
	PRINT 'Schema staging already exists';
END
GO

IF OBJECT_ID(N'staging.AudioFile_Staging', N'U') IS NOT NULL
BEGIN
	DROP TABLE staging. AudioFile_Staging;
	PRINT 'Existing stagin table dropped'
END
GO

CREATE TABLE staging.AudioFile_Staging (
	FileID INT,
    FileName NVARCHAR(255),
    SamplingRateHz FLOAT,
    FileFormat NVARCHAR(50),
    Channels INT,
    DurationSec FLOAT,
    DirectoryPath NVARCHAR(500),
    OriginRaw INT,
    ProcessingStatusRaw NVARCHAR(100),
    ClassRaw NVARCHAR(50),
    DroneTypeRaw INT,
    RotationUniformityRaw NVARCHAR(50),
    DistanceRaw NVARCHAR(50),
    SignalQuality INT,
    RemarksMeta NVARCHAR(MAX),
    MeasuredWeightKg FLOAT,
    SourceTable NVARCHAR(100)
);

PRINT 'staging.AudioFile_Staging created'

PRINT '========================================';
PRINT 'STAGING SETUP';
PRINT 'END';
PRINT '========================================';
GO
