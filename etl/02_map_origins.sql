/*
    File: 02_map_origins.sql
    Layer: ETL
    Purpose: validate data origin mappings

    Description:
    This script validates whether all raw origin identifiers
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.DataOrigin table.

    Notes:
    - does not modify data
    - identifies missing OriginID values
    - should return zero rows in validation query
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: DATA ORIGIN MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw origin values
---------------------------------------------------
PRINT 'Distinct raw origin values found in staging:';

SELECT DISTINCT
    OriginRaw
FROM staging.AudioFile_Staging
ORDER BY OriginRaw;


---------------------------------------------------
-- Find unmapped origin values
---------------------------------------------------
PRINT 'Checking for unmapped origin values...';

SELECT DISTINCT
    s.OriginRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.DataOrigin o
    ON s.OriginRaw = o.OriginID
WHERE s.OriginRaw IS NOT NULL
  AND o.OriginID IS NULL;


---------------------------------------------------
-- Check NULL origin values
---------------------------------------------------
PRINT 'Checking for NULL origin values...';

SELECT *
FROM staging.AudioFile_Staging
WHERE OriginRaw IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.DataOrigin o
    ON s.OriginRaw = o.OriginID;

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
    LEFT JOIN dronesounds.DataOrigin o
        ON s.OriginRaw = o.OriginID
    WHERE s.OriginRaw IS NULL
       OR o.OriginID IS NULL
)
BEGIN
    RAISERROR(
        'Unmapped or NULL origin values detected. Fix DataOrigin lookup before continuing.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All origin values mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: DATA ORIGIN MAPPING';
PRINT 'END';
PRINT '========================================';
GO