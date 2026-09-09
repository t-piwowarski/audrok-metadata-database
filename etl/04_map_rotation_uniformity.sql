/*
    File: 04_map_rotation_uniformity.sql
    Layer: ETL
    Purpose: validate rotation uniformity mappings

    Description:
    This script validates whether all raw rotation uniformity values
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.RotationUniformity lookup table.

    Notes:
    - does not modify data
    - identifies NULL or unmapped rotation codes
    - expected values include C, I, D, V, X
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: ROTATION UNIFORMITY MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw rotation values
---------------------------------------------------
PRINT 'Distinct raw rotation uniformity values found in staging:';

SELECT DISTINCT
    RotationUniformityRaw
FROM staging.AudioFile_Staging
ORDER BY RotationUniformityRaw;


---------------------------------------------------
-- Find unmapped rotation values
---------------------------------------------------
PRINT 'Checking for unmapped rotation uniformity values...';

SELECT DISTINCT
    s.RotationUniformityRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.RotationUniformity ru
    ON s.RotationUniformityRaw = ru.RotationUniformityID
WHERE s.RotationUniformityRaw IS NOT NULL
  AND ru.RotationUniformityID IS NULL;


---------------------------------------------------
-- Check NULL rotation values
---------------------------------------------------
PRINT 'Checking for NULL rotation uniformity values...';

SELECT *
FROM staging.AudioFile_Staging
WHERE RotationUniformityRaw IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.RotationUniformity ru
    ON s.RotationUniformityRaw = ru.RotationUniformityID;

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
    LEFT JOIN dronesounds.RotationUniformity ru
        ON s.RotationUniformityRaw = ru.RotationUniformityID
    WHERE s.RotationUniformityRaw IS NULL
       OR ru.RotationUniformityID IS NULL
)
BEGIN
    RAISERROR(
        'NULL or unmapped rotation uniformity values detected. Fix RotationUniformity lookup or staging values before continuing.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All rotation uniformity values mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: ROTATION UNIFORMITY MAPPING';
PRINT 'END';
PRINT '========================================';
GO