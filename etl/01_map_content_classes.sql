/*
    File: 01_map_content_classes.sql
    Layer: ETL
    Purpose: validate content class mappings

    Description:
    This script validates whether all raw content class values
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.ContentClass lookup table.

    Notes:
    - does not modify data
    - identifies unmapped values
    - should return zero rows in validation query
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: CONTENT CLASS MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw class values
---------------------------------------------------
PRINT 'Distinct raw content class values found in staging:';

SELECT DISTINCT
    ClassRaw
FROM staging.AudioFile_Staging
ORDER BY ClassRaw;


---------------------------------------------------
-- Find unmapped values
---------------------------------------------------
PRINT 'Checking for unmapped content classes...';

SELECT DISTINCT
    s.ClassRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.ContentClass c
    ON s.ClassRaw = c.ClassID
WHERE c.ClassID IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.ContentClass c
    ON s.ClassRaw = c.ClassID;

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
    LEFT JOIN dronesounds.ContentClass c
        ON s.ClassRaw = c.ClassID
    WHERE c.ClassID IS NULL
)
BEGIN
    RAISERROR(
        'Unmapped content classes detected. Fix lookup values before continuing.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All content classes mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: CONTENT CLASS MAPPING';
PRINT 'END';
PRINT '========================================';
GO