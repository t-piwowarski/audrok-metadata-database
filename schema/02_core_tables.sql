/*
    File: 02_core_tables.sql
    Layer: SCHEMA
    Purpose: create core tables for the main domain entities

    Description:
    This script creates the main normalized domain tables for the AuDroK
    database: data origins, drone types, and audio file metadata.

    Notes:
    - run after 00_create_schema.sql and 01_lookup_tables.sql
    - run before foreign key constraints and indexes
    - safe to rerun before constraints are applied
*/

PRINT '========================================';
PRINT 'SCHEMA SETUP: CORE TABLES';
PRINT 'START';
PRINT '========================================';


IF OBJECT_ID(N'dronesounds.AudioFile', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.AudioFile;
    PRINT 'Dropped table: dronesounds.AudioFile';
END;
GO


IF OBJECT_ID(N'dronesounds.DataOrigin', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.DataOrigin;
    PRINT 'Dropped table: dronesounds.DataOrigin';
END;
GO

CREATE TABLE dronesounds.DataOrigin (
    OriginID INT NOT NULL,
    Authors NVARCHAR(255) NULL,
    SourceUrl NVARCHAR(500) NULL,
    LicenseStatus NVARCHAR(100) NULL,
    OriginRemarks NVARCHAR(500) NULL,

    CONSTRAINT PK_DataOrigin PRIMARY KEY (OriginID)
);
GO

PRINT 'Created table: dronesounds.DataOrigin';


IF OBJECT_ID(N'dronesounds.DroneType', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.DroneType;
    PRINT 'Dropped table: dronesounds.DroneType';
END;
GO

CREATE TABLE dronesounds.DroneType (
    DroneTypeID INT NOT NULL,
    DroneTypeName NVARCHAR(150) NOT NULL,
    DroneTypeSubSpec NVARCHAR(150) NULL,
    NRotors TINYINT NULL,
    NCantilevers TINYINT NULL,
    DroneWeightKg DECIMAL(8,3) NULL,
    MaxTotalFlightWeightKg DECIMAL(8,3) NULL,
    Manufacturer NVARCHAR(150) NULL,
    DronePicturePath NVARCHAR(255) NULL,
    UAVClassEurope NVARCHAR(10) NULL,

    CONSTRAINT PK_DroneType PRIMARY KEY (DroneTypeID),
);
GO

PRINT 'Created table: dronesounds.DroneType';


CREATE TABLE dronesounds.AudioFile (
    FileID INT NOT NULL,
    LegacyFileID INT NOT NULL,
    SourceTable NVARCHAR(100) NOT NULL,
    FileName NVARCHAR(255) NOT NULL,
    SamplingRateHz INT NOT NULL,
    FileFormat NVARCHAR(20) NOT NULL,
    Channels TINYINT NOT NULL,
    DurationSec DECIMAL(10,3) NULL,
    DirectoryPath NVARCHAR(400) NULL,
    OriginID INT NOT NULL,
    ProcessingStatusID INT NULL,
    ClassID CHAR(1) NOT NULL,
    DroneTypeID INT NOT NULL,
    RotationUniformityID NVARCHAR(10) NULL,
    DistanceCategoryID NVARCHAR(10) NULL,
    SignalQuality TINYINT NULL,
    RemarksMeta NVARCHAR(1000) NULL,
    MeasuredWeightKg DECIMAL(8,3) NULL,

    CONSTRAINT PK_AudioFile PRIMARY KEY (FileID),

    CONSTRAINT UQ_AudioFile_SourceTable_LegacyFileID
        UNIQUE (SourceTable, LegacyFileID),

    CONSTRAINT CHK_AudioFile_SamplingRateHz
        CHECK (SamplingRateHz > 0),

    CONSTRAINT CHK_AudioFile_Channels
        CHECK (Channels > 0),

    CONSTRAINT CHK_AudioFile_DurationSec
        CHECK (DurationSec IS NULL OR DurationSec > 0),

    CONSTRAINT CHK_AudioFile_SignalQuality
        CHECK (SignalQuality IS NULL OR SignalQuality BETWEEN 1 AND 5),

    CONSTRAINT CHK_AudioFile_MeasuredWeightKg
        CHECK (MeasuredWeightKg IS NULL OR MeasuredWeightKg >= 0)
);
GO

PRINT 'Created table: dronesounds.AudioFile';


PRINT '========================================';
PRINT 'SCHEMA SETUP: CORE TABLES';
PRINT 'END';
PRINT '========================================';
GO