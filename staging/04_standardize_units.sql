/*
    File: 03_standardize_units.sql
    Layer: STAGING
    Purpose: standardize measurement units

    Description:
    Converts raw measurements into standardized units
    required by the final schema.

    Notes:
    - converts kHz → Hz
    - preserves original precision
*/

PRINT '========================================';
PRINT 'STAGING UNIT STANDARDIZATION';
PRINT 'START';
PRINT '========================================';

UPDATE staging.AudioFile_Staging
SET SamplingRateHz = SamplingRateHz * 1000
WHERE SamplingRateHz < 1000;

PRINT 'Sampling rate conversion completed';

/*
    Normalize invalid duration values.

    In the legacy AuDroK data, some records contain ReplayTime_Sek = 0.
    A zero-second audio recording is not meaningful for the final model,
    so such values are treated as missing duration metadata.
*/

UPDATE staging.AudioFile_Staging
SET DurationSec = NULL
WHERE DurationSec IS NOT NULL
  AND DurationSec <= 0;

PRINT 'Non-positive duration values standardized to NULL';
GO

PRINT '========================================';
PRINT 'STAGING UNIT STANDARDIZATION';
PRINT 'END';
PRINT '========================================';
GO