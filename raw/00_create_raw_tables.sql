/*
    File: 00_create_raw_tables.sql
    Layer: RAW
    Purpose: create RAW layer tables reflecting the original AuDroK dataset structure

    Description:
    This script creates the RAW schema and source tables used to store
    unmodified AuDroK source data before staging transformations.

    Notes:
    - tables mirror source structure without normalization
    - no foreign keys or business constraints are applied
    - RAW layer serves as input for staging and ETL pipeline
    - safe to rerun because existing RAW tables are dropped before creation
*/

PRINT '========================================';
PRINT 'RAW SETUP: CREATE RAW TABLES';
PRINT 'START';
PRINT '========================================';


IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'raw'
)
BEGIN
    EXEC('CREATE SCHEMA raw');
    PRINT 'Schema created: raw';
END
ELSE
BEGIN
    PRINT 'Schema already exists: raw';
END;
GO


IF OBJECT_ID(N'raw.tb_digitally_mixed_dr_sound_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_digitally_mixed_dr_sound_data;
    PRINT 'Dropped table: raw.tb_digitally_mixed_dr_sound_data';
END;
GO

CREATE TABLE raw.tb_digitally_mixed_dr_sound_data (
    File_ID INT,
    FileName NVARCHAR(255),
    SubTable NVARCHAR(50),
    Sampling_Rate_kHz INT,
    Format NVARCHAR(50),
    Channels INT,
    ReplayTime_Sek INT,
    Directory_Link NVARCHAR(400),
    Origin INT,
    Proc_Status NVARCHAR(100),
    Data_Descriptor NVARCHAR(50),
    DroneType INT,
    Uniformity_Rotation NVARCHAR(10),
    Distance NVARCHAR(10),
    Sig_Quality INT,
    Remarks_Meta NVARCHAR(1000),
    MeasuredWeight_kg INT
);
GO

PRINT 'Created table: raw.tb_digitally_mixed_dr_sound_data';


IF OBJECT_ID(N'raw.tb_multi_dr_outdoor_pure_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_multi_dr_outdoor_pure_data;
    PRINT 'Dropped table: raw.tb_multi_dr_outdoor_pure_data';
END;
GO

CREATE TABLE raw.tb_multi_dr_outdoor_pure_data (
    File_ID INT NOT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz FLOAT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek FLOAT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg INT NULL
);
GO

PRINT 'Created table: raw.tb_multi_dr_outdoor_pure_data';


IF OBJECT_ID(N'raw.tb_recorded_background_sound_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_recorded_background_sound_data;
    PRINT 'Dropped table: raw.tb_recorded_background_sound_data';
END;
GO

CREATE TABLE raw.tb_recorded_background_sound_data (
    File_ID INT NOT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz INT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek FLOAT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg INT NULL
);
GO

PRINT 'Created table: raw.tb_recorded_background_sound_data';


IF OBJECT_ID(N'raw.tb_short_babble_sound_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_short_babble_sound_data;
    PRINT 'Dropped table: raw.tb_short_babble_sound_data';
END;
GO

CREATE TABLE raw.tb_short_babble_sound_data (
    File_ID INT NOT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz INT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek INT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg INT NULL
);
GO

PRINT 'Created table: raw.tb_short_babble_sound_data';


IF OBJECT_ID(N'raw.tb_single_dr_freefield_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_single_dr_freefield_data;
    PRINT 'Dropped table: raw.tb_single_dr_freefield_data';
END;
GO

CREATE TABLE raw.tb_single_dr_freefield_data (
    File_ID INT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz INT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek INT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg INT NULL,
    Eval_Sig_Uniformity INT NULL,
    Chunk1_Length_ms INT NULL,
    Chunk1_Start_ms INT NULL,
    Chunk1_End_ms INT NULL,
    Chunk1_AvAmplitude INT NULL,
    Chunk1_AvZCross INT NULL,
    Chunk2_Length_ms INT NULL,
    Chunk2_Start_ms INT NULL,
    Chunk2_End_ms INT NULL,
    Chunk2_AvAmplitude INT NULL,
    Chunk2_AvZCross INT NULL,
    Chunk3_Length_ms INT NULL,
    Chunk3_Start_ms INT NULL,
    Chunk3_End_ms INT NULL,
    Chunk3_AvAmplitude INT NULL,
    Chunk3_AvZCross INT NULL
);
GO

PRINT 'Created table: raw.tb_single_dr_freefield_data';


IF OBJECT_ID(N'raw.tb_single_dr_outdoor_noise_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_single_dr_outdoor_noise_data;
    PRINT 'Dropped table: raw.tb_single_dr_outdoor_noise_data';
END;
GO

CREATE TABLE raw.tb_single_dr_outdoor_noise_data (
    File_ID INT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz FLOAT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek INT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg INT NULL
);
GO

PRINT 'Created table: raw.tb_single_dr_outdoor_noise_data';


IF OBJECT_ID(N'raw.tb_single_dr_outdoor_pure_data', N'U') IS NOT NULL
BEGIN
    DROP TABLE raw.tb_single_dr_outdoor_pure_data;
    PRINT 'Dropped table: raw.tb_single_dr_outdoor_pure_data';
END;
GO

CREATE TABLE raw.tb_single_dr_outdoor_pure_data (
    File_ID INT NULL,
    FileName NVARCHAR(255) NULL,
    SubTable NVARCHAR(255) NULL,
    Sampling_Rate_kHz FLOAT NULL,
    Format NVARCHAR(255) NULL,
    Channels INT NULL,
    ReplayTime_Sek FLOAT NULL,
    Directory_Link NVARCHAR(255) NULL,
    Origin INT NULL,
    Proc_Status NVARCHAR(255) NULL,
    Data_Descriptor NVARCHAR(255) NULL,
    DroneType INT NULL,
    Uniformity_Rotation NVARCHAR(255) NULL,
    Distance NVARCHAR(255) NULL,
    Sig_Quality INT NULL,
    Remarks_Meta NVARCHAR(255) NULL,
    MeasuredWeight_kg FLOAT NULL
);
GO

PRINT 'Created table: raw.tb_single_dr_outdoor_pure_data';


PRINT '========================================';
PRINT 'RAW SETUP: CREATE RAW TABLES';
PRINT 'END';
PRINT '========================================';
GO