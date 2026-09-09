/*
    File: 03_map_drone_types.sql
    Layer: ETL
    Purpose: validate drone type mappings

    Description:
    This script validates whether all raw drone type identifiers
    from staging.AudioFile_Staging can be successfully mapped
    to the normalized dronesounds.DroneType table.

    Notes:
    - does not modify data
    - identifies missing DroneTypeID values
    - allows NULL only if the final model intentionally supports unknown drone type
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: DRONE TYPE MAPPING';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Show all distinct raw drone type values
---------------------------------------------------
PRINT 'Distinct raw drone type values found in staging:';

SELECT DISTINCT
    DroneTypeRaw
FROM staging.AudioFile_Staging
ORDER BY DroneTypeRaw;


---------------------------------------------------
-- Find unmapped drone type values
---------------------------------------------------
PRINT 'Checking for unmapped drone type values...';

SELECT DISTINCT
    s.DroneTypeRaw
FROM staging.AudioFile_Staging s
LEFT JOIN dronesounds.DroneType dt
    ON s.DroneTypeRaw = dt.DroneTypeID
WHERE s.DroneTypeRaw IS NOT NULL
  AND dt.DroneTypeID IS NULL;


---------------------------------------------------
-- Check NULL drone type values
---------------------------------------------------
PRINT 'Checking for NULL drone type values...';

SELECT *
FROM staging.AudioFile_Staging
WHERE DroneTypeRaw IS NULL;


---------------------------------------------------
-- Count mapped rows
---------------------------------------------------
DECLARE @MappedRows INT;

SELECT @MappedRows = COUNT(*)
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.DroneType dt
    ON s.DroneTypeRaw = dt.DroneTypeID;

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
    LEFT JOIN dronesounds.DroneType dt
        ON s.DroneTypeRaw = dt.DroneTypeID
    WHERE s.DroneTypeRaw IS NULL
       OR dt.DroneTypeID IS NULL
)
BEGIN
    RAISERROR(
        'NULL or unmapped drone type values detected. Use DroneTypeID = 0 for No Drone.',
        16,
        1
    );
    RETURN;
END;

PRINT 'All drone type values mapped successfully';


PRINT '========================================';
PRINT 'ETL VALIDATION: DRONE TYPE MAPPING';
PRINT 'END';
PRINT '========================================';
GO