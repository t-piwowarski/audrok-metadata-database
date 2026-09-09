/*
    File: 01_lookup_tables.sql
    Layer: SCHEMA
    Purpose: create lookup tables used by the core data model

    Description:
    This script creates small reference tables used to store controlled
    categorical values for the normalized AuDroK database.

    Notes:
    - run after 00_create_schema.sql
    - run before core tables and foreign keys
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SCHEMA SETUP: LOOKUP TABLES';
PRINT 'START';
PRINT '========================================';


IF OBJECT_ID(N'dronesounds.ContentClass', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.ContentClass;
    PRINT 'Dropped table: dronesounds.ContentClass';
END;
GO

CREATE TABLE dronesounds.ContentClass (
    ClassID CHAR(1) NOT NULL,
    ClassName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(300) NULL,

    CONSTRAINT PK_ContentClass PRIMARY KEY (ClassID),
    CONSTRAINT UQ_ContentClass_ClassName UNIQUE (ClassName)
);
GO

PRINT 'Created table: dronesounds.ContentClass';


IF OBJECT_ID(N'dronesounds.RotationUniformity', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.RotationUniformity;
    PRINT 'Dropped table: dronesounds.RotationUniformity';
END;
GO

CREATE TABLE dronesounds.RotationUniformity (
    RotationUniformityID NVARCHAR(10) NOT NULL,
    Meaning NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_RotationUniformity PRIMARY KEY (RotationUniformityID),
    CONSTRAINT UQ_RotationUniformity_Meaning UNIQUE (Meaning)
);
GO

PRINT 'Created table: dronesounds.RotationUniformity';


IF OBJECT_ID(N'dronesounds.DistanceCategory', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.DistanceCategory;
    PRINT 'Dropped table: dronesounds.DistanceCategory';
END;
GO

CREATE TABLE dronesounds.DistanceCategory (
    DistanceCategoryID NVARCHAR(10) NOT NULL,
    Meaning NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_DistanceCategory PRIMARY KEY (DistanceCategoryID),
    CONSTRAINT UQ_DistanceCategory_Meaning UNIQUE (Meaning)
);
GO

PRINT 'Created table: dronesounds.DistanceCategory';


IF OBJECT_ID(N'dronesounds.ProcessingStatus', N'U') IS NOT NULL
BEGIN
    DROP TABLE dronesounds.ProcessingStatus;
    PRINT 'Dropped table: dronesounds.ProcessingStatus';
END;
GO

CREATE TABLE dronesounds.ProcessingStatus (
    ProcessingStatusID INT NOT NULL,
    StatusName NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_ProcessingStatus PRIMARY KEY (ProcessingStatusID),
    CONSTRAINT UQ_ProcessingStatus_StatusName UNIQUE (StatusName)
);
GO

PRINT 'Created table: dronesounds.ProcessingStatus';


PRINT '========================================';
PRINT 'SCHEMA SETUP: LOOKUP TABLES';
PRINT 'END';
PRINT '========================================';
GO