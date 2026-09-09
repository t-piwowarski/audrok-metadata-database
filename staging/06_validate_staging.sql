/*
    File: 05_validate_staging.sql
    Layer: STAGING
    Purpose: validate transformed staging data

    Description:
    Performs validation checks before loading
    data into the final normalized schema.

    Notes:
    - detects duplicates
    - identifies null values
    - flags suspicious measurements
*/

PRINT '========================================';
PRINT 'STAGING VALIDATION';
PRINT 'START';
PRINT '========================================';

PRINT 'Checking duplicate source records by SourceTable and FileID...';

SELECT
    SourceTable,
    FileID,
    COUNT(*) AS DuplicateCount
FROM staging.AudioFile_Staging
GROUP BY
    SourceTable,
    FileID
HAVING COUNT(*) > 1;

PRINT 'Checking missing filenames...';

SELECT *
FROM staging.AudioFile_Staging
WHERE FileName IS NULL;

PRINT 'Checking invalid sampling rates...';

SELECT *
FROM staging.AudioFile_Staging
WHERE SamplingRateHz < 8000;

PRINT 'Checking non-positive duration values...';

IF EXISTS (
    SELECT 1
    FROM staging.AudioFile_Staging
    WHERE DurationSec IS NOT NULL
      AND DurationSec <= 0
)
BEGIN
    SELECT
        SourceTable,
        FileID,
        FileName,
        DurationSec
    FROM staging.AudioFile_Staging
    WHERE DurationSec IS NOT NULL
      AND DurationSec <= 0
    ORDER BY SourceTable, FileID;

    RAISERROR(
        'Non-positive duration values detected in staging.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Checking invalid signal quality values...';

IF EXISTS (
    SELECT 1
    FROM staging.AudioFile_Staging
    WHERE SignalQuality IS NOT NULL
      AND (SignalQuality < 1 OR SignalQuality > 5)
)
BEGIN
    SELECT
        SourceTable,
        FileID,
        FileName,
        SignalQuality
    FROM staging.AudioFile_Staging
    WHERE SignalQuality IS NOT NULL
      AND (SignalQuality < 1 OR SignalQuality > 5)
    ORDER BY SourceTable, FileID;

    RAISERROR(
        'Invalid signal quality values detected in staging.',
        16,
        1
    );
    RETURN;
END;
GO

PRINT 'Checking No Drone convention by content class...';

IF EXISTS (
    SELECT 1
    FROM staging.AudioFile_Staging
    WHERE ClassRaw NOT IN (N'H', N'I')
      AND DroneTypeRaw = 0
)
BEGIN
    SELECT
        SourceTable,
        FileID,
        FileName,
        ClassRaw,
        DroneTypeRaw,
        RemarksMeta
    FROM staging.AudioFile_Staging
    WHERE ClassRaw NOT IN (N'H', N'I')
      AND DroneTypeRaw = 0
    ORDER BY SourceTable, FileID;

    RAISERROR(
        'DroneTypeRaw = 0 detected for drone-containing content classes.',
        16,
        1
    );
    RETURN;
END;

PRINT 'No Drone convention by content class passed';
GO

PRINT 'Checking background/babble no-drone convention...';

IF EXISTS (
    SELECT 1
    FROM staging.AudioFile_Staging
    WHERE ClassRaw IN (N'H', N'I')
      AND DroneTypeRaw <> 0
)
BEGIN
    SELECT
        SourceTable,
        FileID,
        FileName,
        ClassRaw,
        DroneTypeRaw
    FROM staging.AudioFile_Staging
    WHERE ClassRaw IN (N'H', N'I')
      AND DroneTypeRaw <> 0
    ORDER BY SourceTable, FileID;

    RAISERROR(
        'Background or babble records must use DroneTypeRaw = 0.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Background/babble no-drone convention passed';
GO

PRINT 'Validation completed';

PRINT '========================================';
PRINT 'STAGING VALIDATION';
PRINT 'END';
PRINT '========================================';
GO