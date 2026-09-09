/*
    File: 03_drone_types.sql
    Layer: SEEDS
    Purpose: insert seed data into the DroneType table

    Description:
    This script loads the initial list of drone models and their technical
    attributes used by the AuDroK dataset.

    Notes:
    - run after /schema/02_core_tables.sql
    - should be executed before ETL loading
    - includes DroneTypeID = 0 as the required No Drone convention
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SEED LOAD: DRONE TYPES';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.DroneType;

PRINT 'Table truncated: dronesounds.DroneType';


INSERT INTO dronesounds.DroneType (
    DroneTypeID,
    DroneTypeName,
    DroneTypeSubSpec,
    NRotors,
    NCantilevers,
    DroneWeightKg,
    MaxTotalFlightWeightKg,
    Manufacturer,
    DronePicturePath,
    UAVClassEurope
)
VALUES
    (0,  N'No Drone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (1,  N'DJI FPV', NULL, 4, 4, 0.795, 0.795, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI-fpv.png', N'C1'),
    (2,  N'Yuneec H850', NULL, 6, 6, 1.900, 8.000, N'YUNEEC EUROPE GmbH', N'..\DronePictures\Yuneec-850.png', N'C3'),
    (3,  N'Yuneec H850', N'RTK', 6, 6, 1.900, 8.000, N'YUNEEC EUROPE GmbH', N'..\DronePictures\Yuneec-850-rtk.png', N'C3'),
    (4,  N'Yuneec Typhoon H', NULL, 6, 6, 1.950, 1.950, N'YUNEEC EUROPE GmbH', N'..\DronePictures\Yuneec Typhoon-H.png', N'C2'),
    (5,  N'DJI Agras T30', NULL, 6, 6, 24.600, 76.000, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Agras T30.png', N'C3'),
    (6,  N'DJI Matrice 300', N'RTK', 4, 4, 6.300, 9.000, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Matrice300-RTK.png', N'C3'),
    (7,  N'DJI Matrice 300', NULL, 4, 4, 6.300, 9.000, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI M300.png', N'C3'),
    (8,  N'DJI S1000', NULL, 8, 8, 6.000, 11.000, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJIS1000.png', N'C3'),
    (9,  N'Tricopter Uni Saarland', NULL, 3, 3, 1.100, 1.100, N'Universität Saarland', N'..\DronePictures\TriCopterUni-Saar.png', N'C2'),
    (10, N'DJI Mini 3', NULL, 4, 4, 0.248, 0.248, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Mini 3.jpg', N'C0'),
    (11, N'Mambo', NULL, 4, 4, 0.063, 0.063, N'Parrot Drone SAS', N'..\DronePictures\parrot-bebop-2-1-sur-5-2009976083.jpg', N'C0'),
    (12, N'Bebop 1', NULL, 4, 4, 0.411, 0.411, N'Parrot Drone SAS', N'..\DronePictures\Parrot-Mambo-FLY-570x570-3434666460.png', N'C0'),
    (13, N'AR-drone', NULL, 4, 4, 0.420, 0.420, N'Parrot Drone SAS', N'..\DronePictures\AR drone parrot s-l1600.png', N'C1'),
    (14, N'3DR-Solo', NULL, 4, 4, 1.490, 1.490, N'3D Robotics', N'..\DronePictures\3DR Solo drone', N'C2'),
    (15, N'IDEA16', NULL, 4, 4, 0.177, 0.177, N'le-idea', N'..\DronePictures\IDEA16 drone.png', N'C0'),
    (16, N'DJI Phantom 4', N'RTK', 4, 4, 1.600, 1.600, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Phantom4-RTK.png', N'C2'),
    (17, N'DJI Phantom 4', N'PRO', 4, 4, 1.375, 1.375, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI-Phantom-4-Pro.jpg', N'C1'),
    (18, N'Wipkviey T25 Mini', NULL, 4, 4, 0.034, 0.034, N'Shantou Tianyi IT Co., Ltd.', N'..\DronePictures\WintrgaOne Gen II.png', N'C0'),
    (19, N'WintrgaOne Gen II', NULL, 2, 2, 5.000, 5.000, N'Wingtra AG (CH)', N'..\DronePictures\Wipkviey T25 Mini Drohne.jpg', N'C3'),
    (20, N'DJI M30T', NULL, 4, 4, 3.900, 3.900, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI M30T.png', N'C2'),
    (21, N'DJI Mavic Air', NULL, 4, 4, 0.600, 0.600, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Mavic Air.png', N'C1'),
    (22, N'DJI Avata', NULL, 4, 4, 0.410, 0.410, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI-AVATA.png', N'C1'),
    (23, N'DJI Inspire 2', NULL, 4, 4, 3.440, 4.250, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Inspire-2', N'C3'),
    (24, N'DJI Inspire 1', NULL, 4, 4, 2.935, 2.935, N'DJI Technology Co., Ltd.', N'..\DronePictures\dji-inspire1-640x360.jpg', N'C3'),
    (25, N'Hubsan H107D', NULL, 4, 4, 0.057, 0.057, N'Hubsan Shenzhen', N'..\DronePictures\Hubsan H107D.jpg', N'C0'),
    (26, N'HubSan X4', NULL, 4, 4, 0.057, 0.057, N'Hubsan Shenzhen', N'..\DronePictures\Hubsan X4.jpg', N'C0'),
    (27, N'DJI Flame Wheel', N'F450', 4, 4, 0.282, 0.282, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI-FlameWheel_F450-2__57651.jpg', N'C1'),
    (28, N'DJI Phantom 3', N'Adv', 4, 4, 1.280, 1.280, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Phantom 3 Adv.jpg', N'C2'),
    (29, N'Cartonic toy drone', NULL, 4, 4, 0.015, 0.015, N'AUTEC AG', N'..\DronePictures\Cartronic toy drone.png', N'C0'),
    (30, N'Potensic firefly', NULL, 4, 4, 0.025, 0.025, N'Potensic Shenzhen', N'..\DronePictures\Potensic_A20.png', N'C0'),
    (31, N'Emotion', NULL, 4, 4, 0.093, 0.093, N'Eachine China', N'..\DronePictures\EmotionDrone.png', N'C2'),
    (32, N'Mavic Air 2', NULL, 4, 4, 0.566, 0.566, N'DJI Technology Co., Ltd.', N'..\DronePictures\Mavic Air 2.png', N'C1'),
    (33, N'DJI Mavic', N'PRO', 4, 4, 0.734, 0.734, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Mavic Pro.jpg', N'C1'),
    (34, N'DJI Mavic 2', N'PRO', 4, 4, 0.907, 0.907, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Mavic 2 Pro.png', N'C2'),
    (35, N'DJI Mavic 3E', N'3E', 4, 4, 0.915, 0.915, N'DJI Technology Co., Ltd.', N'..\DronePictures\DJI Mavic 3e.png', N'C2'),
    (36, N'HPX4', NULL, 4, 4, 5.490, 6.700, N'Selfmade', N'no pic', N'C3'),
    (37, N'S 500', NULL, 4, 4, 0.440, 0.440, N'Holybro', N'S500-V2-Holybro.png', N'C1'),
    (38, N'DJI Mavic', N'PRO', 4, 4, 0.734, 0.734, N'DJI Technology Co., Ltd.', N'DJI Mavic Pro.jpg', N'C1'),
    (39, N'Bebop 2', NULL, 4, 4, 0.493, 0.493, N'Parrot Drone SAS', N'parrot-bebop-2-1-sur-5-2009976083.jpg', N'C1'),
    (40, N'DJI Matrice 100', NULL, 4, 4, 2.355, 2.355, N'DJI Technology Co., Ltd.', N'DJI Matrice 100 drone.jpg', N'C2'),
    (41, N'DexHawk', NULL, 8, 8, 7.000, 7.000, N'Selfmade DLR', N'dlr-dexhawk-research-drone-hg-3265799927.jpg', N'C3'),
    (42, N'Evo X8', NULL, 8, 8, 2.700, 7.500, N'Premium Modellbau', N'EVO X8 Oktokopter.png', N'C3'),
    (43, N'HP-E616P-1', NULL, 6, NULL, 24.500, NULL, N'Self-Made', NULL, N'C3'),
    (44, N'DJI Matrice 30 T', NULL, 4, NULL, 3.800, NULL, N'DJI', NULL, N'C2'),
	(999, N'Multiple drones', N'DJI Inspire 2 + DJI Matrice 300', NULL, NULL, NULL, NULL, N'Multiple manufacturers', NULL, NULL);
GO


PRINT 'Drone types inserted successfully';

DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.DroneType;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: DRONE TYPES';
PRINT 'END';
PRINT '========================================';
GO