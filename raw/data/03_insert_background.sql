/*
    File: 03_insert_background.sql
    Layer: RAW
    Purpose: load raw data into tb_recorded_background_sound_data

    Description:
    This script inserts unmodified source data from the AuDroK dataset
    into the RAW layer. No transformations, cleaning, or validation are applied.

    Notes:
    - data reflects original source structure
    - used as input for staging layer transformations
    - safe to rerun (table is truncated before insert)
*/

PRINT '========================================';
PRINT 'RAW LOAD: tb_recorded_background_sound_data';
PRINT 'START';
PRINT '========================================';

-- Safety: clear table before reload
TRUNCATE TABLE raw.tb_recorded_background_sound_data;

PRINT 'Table truncated';

-- Insert data
INSERT INTO raw.tb_recorded_background_sound_data (
	File_ID,
	FileName,
	SubTable,
	Sampling_Rate_kHz, 
	Format, Channels,
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
	(1,  N' white_noise000',        N' NO ', 16, N' wav', 1, 5.1,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(2,  N' white_noise001',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(3,  N' white_noise002',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(4,  N' white_noise003',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(5,  N' white_noise004',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(6,  N' white_noise005',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(7,  N' white_noise006',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(8,  N' white_noise007',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(9,  N' white_noise008',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(10, N' white_noise009',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(11, N' white_noise010',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(12, N' white_noise011',        N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\WhiteNoise_Al-Emadi\',     43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(13, N' pink_noise000',         N' NO ', 16, N' wav', 1, 5.1,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(14, N' pink_noise001',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(15, N' pink_noise002',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(16, N' pink_noise003',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(17, N' pink_noise004',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(18, N' pink_noise005',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(19, N' pink_noise006',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(20, N' pink_noise007',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(21, N' pink_noise008',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(22, N' pink_noise009',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(23, N' pink_noise010',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(24, N' pink_noise011',         N' NO ', 16, N' wav', 1, 5.0,  N' ..\AuDroKSoundData\PinkNoise_Al-Emadi\',      43, N' unchanged', N' f', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(25, N' doing_the_dishes000',   N' NO ', 16, N' wav', 1, 5.1,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(26, N' doing_the_dishes001',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(27, N' doing_the_dishes002',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(28, N' doing_the_dishes003',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(29, N' doing_the_dishes004',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(30, N' doing_the_dishes005',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(31, N' doing_the_dishes006',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(32, N' doing_the_dishes007',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(33, N' doing_the_dishes008',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(34, N' doing_the_dishes009',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(35, N' doing_the_dishes010',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(36, N' doing_the_dishes011',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(37, N' doing_the_dishes012',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(38, N' doing_the_dishes013',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(39, N' doing_the_dishes014',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(40, N' doing_the_dishes015',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(41, N' doing_the_dishes016',   N' NO ', 16, N' wav', 1, 5.1,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(42, N' doing_the_dishes017',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(43, N' doing_the_dishes018',   N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(44, N' exercise_bike000',      N' NO ', 16, N' wav', 1, 5.1,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(45, N' exercise_bike001',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(46, N' exercise_bike002',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(47, N' exercise_bike003',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(48, N' exercise_bike004',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(49, N' exercise_bike005',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(50, N' exercise_bike006',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(51, N' exercise_bike007',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(52, N' exercise_bike008',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(53, N' exercise_bike009',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(54, N' exercise_bike010',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(55, N' exercise_bike011',      N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(56, N' running_tap000',        N' NO ', 16, N' wav', 1, 5.1,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(57, N' running_tap001',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(58, N' running_tap002',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(59, N' running_tap003',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(60, N' running_tap004',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(61, N' running_tap005',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(62, N' running_tap006',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(63, N' running_tap007',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(64, N' running_tap008',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(65, N' running_tap009',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(66, N' running_tap010',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(67, N' running_tap011',        N' NO ', 16, N' wav', 1, 5.0,  N'..\AuDroKSoundData\Background_Al-Emadi\',       43, N' unchanged', N' d', 0, N'x', N'x', 2, N'//arxiv.org/pdf/1804.03209.pdf', 0),
	(68, N'BACKGROUND_001',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(69, N'BACKGROUND_002',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(70, N'BACKGROUND_003',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(71, N'BACKGROUND_004',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(72, N'BACKGROUND_005',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(73, N'BACKGROUND_006',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(74, N'BACKGROUND_007',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(75, N'BACKGROUND_008',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(76, N'BACKGROUND_009',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(77, N'BACKGROUND_010',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(78, N'BACKGROUND_011',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(79, N'BACKGROUND_012',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(80, N'BACKGROUND_013',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(81, N'BACKGROUND_014',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(82, N'BACKGROUND_015',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(83, N'BACKGROUND_016',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(84, N'BACKGROUND_017',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(85, N'BACKGROUND_018',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(86, N'BACKGROUND_019',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(87, N'BACKGROUND_020',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(88, N'BACKGROUND_021',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(89, N'BACKGROUND_022',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(90, N'BACKGROUND_023',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(91, N'BACKGROUND_024',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(92, N'BACKGROUND_025',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(93, N'BACKGROUND_026',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(94, N'BACKGROUND_027',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(95, N'BACKGROUND_028',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(96, N'BACKGROUND_029',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(97, N'BACKGROUND_030',         N' NO ', 44, N' wav', 2, 10.0, N'..\AuDroKSoundData\Svanström_Audio\',            50, N' unchanged', N' d', 0, N'x', N'x', 2, N' ', 0),
	(98,  N' VacuumCleanerLAC-Mi1', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(99,  N' VacuumCleanerLAC-Mi2', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(100, N' VacuumCleanerLAC-Mi3', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(101, N' VacuumCleanerLAC-Mi4', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(102, N' VacuumCleanerLAC-Mi5', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(103, N' VacuumCleanerLAC-Mi6', N' NO ', 44, N' wav', 1,  9.7, N' ..\AuDroKSoundData\23-02-22 Background\32 Hoover', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Vacuum Cleaner in Large Anechoic Chamber', 0),
	(104, N' ConversationBG-LAC-Mi1', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0),
	(105, N' ConversationBG-LAC-Mi2', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0),
	(106, N' ConversationBG-LAC-Mi3', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0),
	(107, N' ConversationBG-LAC-Mi4', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0),
	(108, N' ConversationBG-LAC-Mi5', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0),
	(109, N' ConversationBG-LAC-Mi6', N' NO ', 44, N' wav', 1, 150.5, N' ..\AuDroKSoundData\23-02-22 Background\80 Conversations', 52, N' raw', N' a', 0, N'x', N'x', 1, N'Conversation background in Large Anechoic Chamber', 0);

PRINT 'Insert completed';

-- Optional: quick validation
DECLARE @RowCount INT;
SELECT @RowCount = COUNT(*) FROM raw.tb_recorded_background_sound_data;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR);

PRINT '========================================';
PRINT 'RAW LOAD: tb_recorded_background_sound_data';
PRINT 'END';
PRINT '========================================';
GO