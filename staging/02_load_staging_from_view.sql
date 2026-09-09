/*
    File: 02_load_staging_from_view.sql
    Layer: STAGING
    Purpose: load unified raw audio data into staging table

    Description:
    This script loads data from the unified RAW source view into the physical
    staging table. The data is copied into staging.AudioFile_Staging so that
    later cleaning and standardization scripts can update it safely.

    Notes:
    - source data comes from staging.v_AllAudioRaw
    - staging table is truncated before reload
    - this step does not perform final lookup mapping
*/

PRINT '========================================';
PRINT 'STAGING LOAD: AudioFile_Staging';
PRINT 'START';
PRINT '========================================';

TRUNCATE TABLE staging.AudioFile_Staging;

PRINT 'Staging table truncated';

INSERT INTO staging.AudioFile_Staging (
    FileID,
    FileName,
    SamplingRateHz,
    FileFormat,
    Channels,
    DurationSec,
    DirectoryPath,
    OriginRaw,
    ProcessingStatusRaw,
    ClassRaw,
    DroneTypeRaw,
    RotationUniformityRaw,
    DistanceRaw,
    SignalQuality,
    RemarksMeta,
    MeasuredWeightKg,
    SourceTable
)
SELECT
    File_ID AS FileID,
    FileName,
    Sampling_Rate_kHz AS SamplingRateHz,
    [Format] AS FileFormat,
    [Channels] AS Channels,
    ReplayTime_Sek AS DurationSec,
    Directory_Link AS DirectoryPath,
    [Origin] AS OriginRaw,
    Proc_Status AS ProcessingStatusRaw,
    ContentClassRaw AS ClassRaw,
    DroneType AS DroneTypeRaw,
    Uniformity_Rotation AS RotationUniformityRaw,
    [Distance] AS DistanceRaw,
    Sig_Quality AS SignalQuality,
    Remarks_Meta AS RemarksMeta,
    MeasuredWeight_kg AS MeasuredWeightKg,
    SourceTable
FROM staging.v_AllAudioRaw;

PRINT 'Insert into staging completed';

DECLARE @RowCount INT;
SELECT @RowCount = COUNT(*)
FROM staging.AudioFile_Staging;

PRINT 'Rows loaded into staging: ' + CAST(@RowCount AS NVARCHAR);

PRINT '========================================';
PRINT 'STAGING LOAD: AudioFile_Staging';
PRINT 'END';
PRINT '========================================';
GO