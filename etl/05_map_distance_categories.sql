/*
    File: 05_map_distance_categories.sql
    Layer: ETL
    Purpose: validate distance category mappings

    Description:
    This script validates whether all raw distance category values
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.DistanceCategory lookup table.

    Notes:
    - does not modify data
    - identifies NULL or unmapped distance codes
    - expected values include C, M, D, V, X
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: DISTANCE CATEGORY MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw distance values
---------------------------------------------------
PRINT 'Distinct raw distance category values found in staging:';

SELECT DISTINCT
    DistanceRaw
FROM staging.AudioFile_Staging
ORDER BY DistanceRaw;


---------------------------------------------------
-- Find unmapped distance values
---------------------------------------------------
PRINT 'Checking for unmapped distance category values...';

SELECT DISTINCT
    s.DistanceRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.DistanceCategory dc
    ON s.DistanceRaw = dc.DistanceCategoryID
WHERE s.DistanceRaw IS NOT NULL
  AND dc.DistanceCategoryID IS NULL;


---------------------------------------------------
-- Check NULL distance values
---------------------------------------------------
PRINT 'Checking for NULL distance category values...';

SELECT *
FROM staging.AudioFile_Staging
WHERE DistanceRaw IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.DistanceCategory dc
    ON s.DistanceRaw = dc.DistanceCategoryID;

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
    LEFT JOIN dronesounds.DistanceCategory dc
        ON s.DistanceRaw = dc.DistanceCategoryID
    WHERE s.DistanceRaw IS NULL
       OR dc.DistanceCategoryID IS NULL
)
BEGIN
    RAISERROR(
        'NULL or unmapped distance category values detected. Fix DistanceCategory lookup or staging values before continuing.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All distance category values mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: DISTANCE CATEGORY MAPPING';
PRINT 'END';
PRINT '========================================';
GO