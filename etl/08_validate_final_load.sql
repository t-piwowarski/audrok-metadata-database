/*
    File: 08_validate_final_load.sql
    Layer: ETL
    Purpose: validate final AudioFile load

    Description:
    This script performs post-load validation checks on the final normalized
    dronesounds.AudioFile table. It compares row counts between staging and
    final layers, checks for duplicate identifiers, missing required values,
    invalid numeric ranges, and broken lookup relationships.

    Notes:
    - run after 07_load_audio_files.sql
    - does not modify data
    - should return zero rows in all anomaly queries
*/

PRINT '========================================';
PRINT 'ETL VALIDATION: FINAL AUDIOFILE LOAD';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Compare staging and final row counts
---------------------------------------------------
DECLARE @StagingRowCount INT;
DECLARE @FinalRowCount INT;

SELECT @StagingRowCount = COUNT(*)
FROM staging.AudioFile_Staging;

SELECT @FinalRowCount = COUNT(*)
FROM dronesounds.AudioFile;

PRINT 'Rows in staging: ' + CAST(@StagingRowCount AS NVARCHAR(20));
PRINT 'Rows in final AudioFile: ' + CAST(@FinalRowCount AS NVARCHAR(20));

IF @StagingRowCount <> @FinalRowCount
BEGIN
    RAISERROR(
        'Row count mismatch between staging and final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Row count validation passed';


---------------------------------------------------
-- Check duplicate FileID values
---------------------------------------------------
PRINT 'Checking duplicate FileID values...';

IF EXISTS (
    SELECT FileID
    FROM dronesounds.AudioFile
    GROUP BY FileID
    HAVING COUNT(*) > 1
)
BEGIN
    SELECT FileID, COUNT(*) AS DuplicateCount
    FROM dronesounds.AudioFile
    GROUP BY FileID
    HAVING COUNT(*) > 1;

    RAISERROR(
        'Duplicate FileID values detected in final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'No duplicate FileID values found';

---------------------------------------------------
-- Check duplicate legacy source identifiers
---------------------------------------------------
PRINT 'Checking duplicate legacy source identifiers...';

IF EXISTS (
    SELECT 1
    FROM dronesounds.AudioFile
    GROUP BY SourceTable, LegacyFileID
    HAVING COUNT(*) > 1
)
BEGIN
    SELECT
        SourceTable,
        LegacyFileID,
        COUNT(*) AS DuplicateCount
    FROM dronesounds.AudioFile
    GROUP BY
        SourceTable,
        LegacyFileID
    HAVING COUNT(*) > 1;

    RAISERROR(
        'Duplicate legacy source identifiers detected in final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'No duplicate legacy source identifiers found';

---------------------------------------------------
-- Check required columns
---------------------------------------------------
PRINT 'Checking required final fields...';

IF EXISTS (
    SELECT 1
    FROM dronesounds.AudioFile
    WHERE FileName IS NULL
       OR SamplingRateHz IS NULL
       OR FileFormat IS NULL
       OR Channels IS NULL
       OR OriginID IS NULL
       OR ProcessingStatusID IS NULL
       OR ClassID IS NULL
       OR DroneTypeID IS NULL
)
BEGIN
    SELECT *
    FROM dronesounds.AudioFile
    WHERE FileName IS NULL
       OR SamplingRateHz IS NULL
       OR FileFormat IS NULL
       OR Channels IS NULL
       OR OriginID IS NULL
       OR ProcessingStatusID IS NULL
       OR ClassID IS NULL
       OR DroneTypeID IS NULL;

    RAISERROR(
        'Required NULL values detected in final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Required field validation passed';


---------------------------------------------------
-- Check numeric ranges
---------------------------------------------------
PRINT 'Checking numeric ranges...';

IF EXISTS (
    SELECT 1
    FROM dronesounds.AudioFile
    WHERE SamplingRateHz <= 0
       OR Channels <= 0
       OR (DurationSec IS NOT NULL AND DurationSec <= 0)
       OR (SignalQuality IS NOT NULL AND SignalQuality NOT BETWEEN 1 AND 5)
       OR (MeasuredWeightKg IS NOT NULL AND MeasuredWeightKg < 0)
)
BEGIN
    SELECT *
    FROM dronesounds.AudioFile
    WHERE SamplingRateHz <= 0
       OR Channels <= 0
       OR (DurationSec IS NOT NULL AND DurationSec <= 0)
       OR (SignalQuality IS NOT NULL AND SignalQuality NOT BETWEEN 1 AND 5)
       OR (MeasuredWeightKg IS NOT NULL AND MeasuredWeightKg < 0);

    RAISERROR(
        'Invalid numeric values detected in final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Numeric range validation passed';


---------------------------------------------------
-- Check lookup relationships
---------------------------------------------------
PRINT 'Checking lookup relationships...';

IF EXISTS (
    SELECT 1
    FROM dronesounds.AudioFile af
    LEFT JOIN dronesounds.DataOrigin o
        ON af.OriginID = o.OriginID
    LEFT JOIN dronesounds.ProcessingStatus ps
        ON af.ProcessingStatusID = ps.ProcessingStatusID
    LEFT JOIN dronesounds.ContentClass cc
        ON af.ClassID = cc.ClassID
    LEFT JOIN dronesounds.DroneType dt
        ON af.DroneTypeID = dt.DroneTypeID
    LEFT JOIN dronesounds.RotationUniformity ru
        ON af.RotationUniformityID = ru.RotationUniformityID
    LEFT JOIN dronesounds.DistanceCategory dc
        ON af.DistanceCategoryID = dc.DistanceCategoryID
    WHERE o.OriginID IS NULL
       OR ps.ProcessingStatusID IS NULL
       OR cc.ClassID IS NULL
       OR dt.DroneTypeID IS NULL
       OR (af.RotationUniformityID IS NOT NULL AND ru.RotationUniformityID IS NULL)
       OR (af.DistanceCategoryID IS NOT NULL AND dc.DistanceCategoryID IS NULL)
)
BEGIN
    SELECT af.*
    FROM dronesounds.AudioFile af
    LEFT JOIN dronesounds.DataOrigin o
        ON af.OriginID = o.OriginID
    LEFT JOIN dronesounds.ProcessingStatus ps
        ON af.ProcessingStatusID = ps.ProcessingStatusID
    LEFT JOIN dronesounds.ContentClass cc
        ON af.ClassID = cc.ClassID
    LEFT JOIN dronesounds.DroneType dt
        ON af.DroneTypeID = dt.DroneTypeID
    LEFT JOIN dronesounds.RotationUniformity ru
        ON af.RotationUniformityID = ru.RotationUniformityID
    LEFT JOIN dronesounds.DistanceCategory dc
        ON af.DistanceCategoryID = dc.DistanceCategoryID
    WHERE o.OriginID IS NULL
       OR ps.ProcessingStatusID IS NULL
       OR cc.ClassID IS NULL
       OR dt.DroneTypeID IS NULL
       OR (af.RotationUniformityID IS NOT NULL AND ru.RotationUniformityID IS NULL)
       OR (af.DistanceCategoryID IS NOT NULL AND dc.DistanceCategoryID IS NULL);

    RAISERROR(
        'Broken lookup relationships detected in final AudioFile table.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Lookup relationship validation passed';


---------------------------------------------------
-- Check No Drone convention
---------------------------------------------------
PRINT 'Checking No Drone convention...';

IF NOT EXISTS (
    SELECT 1
    FROM dronesounds.DroneType
    WHERE DroneTypeID = 0
      AND DroneTypeName = N'No Drone'
)
BEGIN
    RAISERROR(
        'Missing required DroneTypeID = 0 record for No Drone convention.',
        16,
        1
    );
    RETURN;
END;

PRINT 'No Drone convention validation passed';


PRINT 'Final AudioFile validation completed successfully';

PRINT '========================================';
PRINT 'ETL VALIDATION: FINAL AUDIOFILE LOAD';
PRINT 'END';
PRINT '========================================';
GO