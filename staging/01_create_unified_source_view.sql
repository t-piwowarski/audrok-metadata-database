/*
    File: 01_create_unified_source_view.sql
    Layer: STAGING
    Purpose: create unified view over all raw AuDroK audio source tables

    Description:
    This script creates a unified staging view that exposes all RAW audio
    source tables through one common column structure. No data is physically
    copied at this stage.
	The view preserves original Data_Descriptor values and additionally
    assigns the correct content class based on the source RAW table.

    Notes:
	- run after /raw/00_create_raw_tables.sql
    - run before /staging/02_load_staging_from_view.sql
    - source table name is used for final ContentClass mapping
    - combines all raw source tables with UNION ALL
    - preserves source table information in SourceTable column
    - used as input for loading staging.AudioFile_Staging
*/

PRINT '========================================';
PRINT 'STAGING VIEW: v_AllAudioRaw';
PRINT 'START';
PRINT '========================================';

IF OBJECT_ID(N'staging.v_AllAudioRaw', N'V') IS NOT NULL
BEGIN
    DROP VIEW staging.v_AllAudioRaw;
    PRINT 'Existing view dropped';
END;
GO

CREATE VIEW staging.v_AllAudioRaw AS

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'G' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_digitally_mixed_dr_sound_data' AS SourceTable
FROM raw.tb_digitally_mixed_dr_sound_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'E' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_multi_dr_outdoor_pure_data' AS SourceTable
FROM raw.tb_multi_dr_outdoor_pure_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'H' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_recorded_background_sound_data' AS SourceTable
FROM raw.tb_recorded_background_sound_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'I' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_short_babble_sound_data' AS SourceTable
FROM raw.tb_short_babble_sound_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'A' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_single_dr_freefield_data' AS SourceTable
FROM raw.tb_single_dr_freefield_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'C' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_single_dr_outdoor_noise_data' AS SourceTable
FROM raw.tb_single_dr_outdoor_noise_data

UNION ALL

SELECT
    File_ID,
    FileName,
    SubTable,
    Sampling_Rate_kHz,
    [Format],
    [Channels],
    ReplayTime_Sek,
    Directory_Link,
    [Origin],
    Proc_Status,
    Data_Descriptor,
    N'B' AS ContentClassRaw,
    DroneType,
    Uniformity_Rotation,
    [Distance],
    Sig_Quality,
    Remarks_Meta,
    MeasuredWeight_kg,
    N'tb_single_dr_outdoor_pure_data' AS SourceTable
FROM raw.tb_single_dr_outdoor_pure_data;
GO

PRINT 'Unified source view created';

PRINT '========================================';
PRINT 'STAGING VIEW: v_AllAudioRaw';
PRINT 'END';
PRINT '========================================';
GO