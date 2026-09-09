/*
    File: 00_prepare_etl.sql
    Layer: ETL
    Purpose: prepare ETL execution environment

    Description:
    This script validates whether the ETL process can safely begin.
    It checks staging availability, validates lookup tables,
    and ensures final schema readiness before loading data.

    Notes:
    - run after staging layer
    - run before final ETL load scripts
    - does not modify any data
*/

PRINT '========================================';
PRINT 'ETL PREPARATION';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Check staging table existence
---------------------------------------------------
IF OBJECT_ID(N'staging.AudioFile_Staging', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing table: staging.AudioFile_Staging. Run staging scripts first.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Staging table exists';


---------------------------------------------------
-- Check staging table contains data
---------------------------------------------------
DECLARE @StagingRowCount INT;

SELECT @StagingRowCount = COUNT(*)
FROM staging.AudioFile_Staging;

IF @StagingRowCount = 0
BEGIN
    RAISERROR(
        'Staging table is empty. Load staging data before running ETL.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Rows available in staging: ' + CAST(@StagingRowCount AS NVARCHAR(20));


---------------------------------------------------
-- Check final AudioFile table existence
---------------------------------------------------
IF OBJECT_ID(N'dronesounds.AudioFile', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing table: dronesounds.AudioFile. Run schema scripts first.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Final table exists: dronesounds.AudioFile';


---------------------------------------------------
-- Check lookup table existence
---------------------------------------------------
IF OBJECT_ID(N'dronesounds.ContentClass', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.ContentClass.',
        16,
        1
    );
    RETURN;
END;

IF OBJECT_ID(N'dronesounds.DataOrigin', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.DataOrigin.',
        16,
        1
    );
    RETURN;
END;

IF OBJECT_ID(N'dronesounds.DroneType', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.DroneType.',
        16,
        1
    );
    RETURN;
END;

IF OBJECT_ID(N'dronesounds.RotationUniformity', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.RotationUniformity.',
        16,
        1
    );
    RETURN;
END;

IF OBJECT_ID(N'dronesounds.DistanceCategory', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.DistanceCategory.',
        16,
        1
    );
    RETURN;
END;

IF OBJECT_ID(N'dronesounds.ProcessingStatus', N'U') IS NULL
BEGIN
    RAISERROR(
        'Missing lookup table: dronesounds.ProcessingStatus.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All lookup tables exist';


---------------------------------------------------
-- Check lookup tables contain data
---------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM dronesounds.ContentClass)
BEGIN
    RAISERROR(
        'Lookup table ContentClass is empty.',
        16,
        1
    );
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dronesounds.DataOrigin)
BEGIN
    RAISERROR(
        'Lookup table DataOrigin is empty.',
        16,
        1
    );
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dronesounds.DroneType)
BEGIN
    RAISERROR(
        'Lookup table DroneType is empty.',
        16,
        1
    );
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dronesounds.RotationUniformity)
BEGIN
    RAISERROR(
        'Lookup table RotationUniformity is empty.',
        16,
        1
    );
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dronesounds.DistanceCategory)
BEGIN
    RAISERROR(
        'Lookup table DistanceCategory is empty.',
        16,
        1
    );
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dronesounds.ProcessingStatus)
BEGIN
    RAISERROR(
        'Lookup table ProcessingStatus is empty.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Lookup tables contain required data';


---------------------------------------------------
-- Optional final table row count
---------------------------------------------------
DECLARE @FinalRowCount INT;

SELECT @FinalRowCount = COUNT(*)
FROM dronesounds.AudioFile;

PRINT 'Current rows in final AudioFile table: '
    + CAST(@FinalRowCount AS NVARCHAR(20));


PRINT 'ETL preparation completed successfully';

PRINT '========================================';
PRINT 'ETL PREPARATION';
PRINT 'END';
PRINT '========================================';
GO