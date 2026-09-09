/*
    File: 02_insert_multi_dr_outdoor.sql
    Layer: RAW
    Purpose: load raw data into tb_multi_dr_outdoor_pure_data

    Description:
    This script inserts unmodified source data from the AuDroK dataset
    into the RAW layer. No transformations, cleaning, or validation are applied.

    Notes:
    - data reflects original source structure
    - used as input for staging layer transformations
    - safe to rerun (table is truncated before insert)
*/

PRINT '========================================';
PRINT 'RAW LOAD: tb_multi_dr_outdoor_pure_data';
PRINT 'START';
PRINT '========================================';

-- Safety: clear table before reload
TRUNCATE TABLE raw.tb_multi_dr_outdoor_pure_data;

PRINT 'Table truncated';

-- Insert data
INSERT INTO raw.tb_multi_dr_outdoor_pure_data (
	File_ID,
	FileName,
	SubTable,
	Sampling_Rate_kHz,
	Format,
	Channels,
	ReplayTime_Sek,
	Directory_Link,
	Origin,
	Proc_Status,
	Data_Descriptor,
	DroneType,
	Uniformity_Rotation,
	Distance,
	Sig_Quality,
	Remarks_Meta,
	MeasuredWeight_kg
)
VALUES
	(1, N'54-23_7-var-Mic1', N' NO ', 44.1, N' wav', 1, 139.5, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' amplified F=10', N'b', 0, N'V', N'c', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(2, N'54-23_7-var-Arr1', N' NO ', 44.1, N' wav', 1, 139.5, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(3, N'54-23_7-var-Arr2', N' NO ', 44.1, N' wav', 1, 139.5, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(4, N'54-23_7-var-Arr3', N' NO ', 44.1, N' wav', 1, 139.5, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(5, N'55-23_7-var-Mic1', N' NO ', 44.1, N' wav', 1, 168.8, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(6, N'55-23_7-var-Arr1', N' NO ', 44.1, N' wav', 1, 168.8, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(7, N'55-23_7-var-Arr2', N' NO ', 44.1, N' wav', 1, 168.8, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0),
	(8, N'55-23_7-var-Arr3', N' NO ', 44.1, N' wav', 1, 168.8, N' ..\\AuDroKSoundData\23-06-07 Measurements\MultiDr', 54, N' array average + amplified F=10', N'b', 0, N'V', N'V', 2, N'Two drones: DJI Inspire 2 (23) and DJI M300 (7) |free flight condtions', 0);

PRINT 'Insert completed';

-- Optional: quick validation
DECLARE @RowCount INT;
SELECT @RowCount = COUNT(*) FROM raw.tb_multi_dr_outdoor_pure_data;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR);

PRINT '========================================';
PRINT 'RAW LOAD: tb_multi_dr_outdoor_pure_data';
PRINT 'END';
PRINT '========================================';
GO
