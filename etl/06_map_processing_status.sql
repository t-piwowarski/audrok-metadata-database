/*
    File: 06_map_processing_status.sql
    Layer: ETL
    Purpose: validate processing status mappings

    Description:
    This script validates whether all raw processing status values
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.ProcessingStatus lookup table.

    Notes:
    - does not modify data
    - identifies NULL or unmapped processing statuses
    - expected values must exist in dronesounds.ProcessingStatus.StatusName
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: PROCESSING STATUS MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw processing status values
---------------------------------------------------
PRINT 'Distinct raw processing status values found in staging:';

SELECT DISTINCT
    ProcessingStatusRaw
FROM staging.AudioFile_Staging
ORDER BY ProcessingStatusRaw;


---------------------------------------------------
-- Find unmapped processing status values
---------------------------------------------------
PRINT 'Checking for unmapped processing status values...';

SELECT DISTINCT
    s.ProcessingStatusRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.ProcessingStatus ps
    ON s.ProcessingStatusRaw = LOWER(ps.StatusName)
WHERE s.ProcessingStatusRaw IS NOT NULL
  AND ps.ProcessingStatusID IS NULL;


---------------------------------------------------
-- Check NULL processing status values
---------------------------------------------------
PRINT 'Checking for NULL processing status values...';

SELECT *
FROM staging.AudioFile_Staging
WHERE ProcessingStatusRaw IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.ProcessingStatus ps
    ON s.ProcessingStatusRaw = LOWER(ps.StatusName);

PRINT 'Successfully mapped rows: '
    + CAST(@MappedRows AS NVARCHAR(20));


---------------------------------------------------
-- Count total staging rows
---------------------------------------------------
DECLARE @TotalRows INT;

SELECT @TotalRows = COUNT(*)
FROM staging.AudioFile_Staging;

PRINT 'Total staging rows: '
    + CAST(@TotalRows AS NVARCHAR(20));


---------------------------------------------------
-- Validation summary
---------------------------------------------------
IF EXISTS (
    SELECT 1
    FROM staging.AudioFile_Staging s
    LEFT JOIN dronesounds.ProcessingStatus ps
        ON s.ProcessingStatusRaw = LOWER(ps.StatusName)
    WHERE s.ProcessingStatusRaw IS NULL
       OR ps.ProcessingStatusID IS NULL
)
BEGIN
    RAISERROR(
        'NULL or unmapped processing status values detected. Fix ProcessingStatus lookup or staging values before continuing.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All processing status values mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: PROCESSING STATUS MAPPING';
PRINT 'END';
PRINT '========================================';
GO