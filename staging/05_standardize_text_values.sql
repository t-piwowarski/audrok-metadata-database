/*
    File: 04_standardize_text_values.sql
    Layer: STAGING
    Purpose: standardize categorical text values

    Description:
    This script normalizes categorical text fields
    before lookup table mapping.

    Notes:
    - normalizes casing
    - reduces matching errors during ETL
*/

PRINT '========================================';
PRINT 'TEXT STANDARDIZATION';
PRINT 'START';
PRINT '========================================';

UPDATE staging.AudioFile_Staging
SET DroneTypeRaw = 0
WHERE ClassRaw IN (N'H', N'I') 
	AND DroneTypeRaw IS NULL;
GO

UPDATE staging.AudioFile_Staging
SET ClassRaw = UPPER(ClassRaw)
WHERE ClassRaw IS NOT NULL;

UPDATE staging.AudioFile_Staging
SET FileFormat = LOWER(FileFormat);

UPDATE staging.AudioFile_Staging
SET ProcessingStatusRaw = LOWER(ProcessingStatusRaw);

UPDATE staging.AudioFile_Staging
SET ProcessingStatusRaw =
    CASE
        WHEN ProcessingStatusRaw = N'unchanged'
            THEN N'unchanged from source'

        WHEN ProcessingStatusRaw = N'raw data'
            THEN N'raw'

        WHEN ProcessingStatusRaw = N'array average + amplified  f=10'
            THEN N'array average + amplified f=10'

        ELSE ProcessingStatusRaw
    END;

UPDATE staging.AudioFile_Staging
SET RotationUniformityRaw = UPPER(RotationUniformityRaw);

UPDATE staging.AudioFile_Staging
SET RotationUniformityRaw = N'V'
WHERE RotationUniformityRaw IN (N'CV', N'VC');

UPDATE staging.AudioFile_Staging
SET DistanceRaw = UPPER(DistanceRaw);

UPDATE staging.AudioFile_Staging
SET DistanceRaw = N'X'
WHERE DistanceRaw = N'U';

/*
    Normalize invalid signal quality values.

    Final model accepts only values from 1 to 5.
    Legacy values outside this range are treated as missing quality metadata.
*/

PRINT 'Standardizing multi-drone recordings...';

UPDATE staging.AudioFile_Staging
SET DroneTypeRaw = 999
WHERE ClassRaw = N'E'
  AND SourceTable = N'tb_multi_dr_outdoor_pure_data';

PRINT 'Multi-drone recordings standardized';
GO

UPDATE staging.AudioFile_Staging
SET SignalQuality = NULL
WHERE SignalQuality IS NOT NULL
  AND (SignalQuality < 1 OR SignalQuality > 5);

PRINT 'Text normalization completed';

PRINT '========================================';
PRINT 'TEXT STANDARDIZATION';
PRINT 'END';
PRINT '========================================';
GO