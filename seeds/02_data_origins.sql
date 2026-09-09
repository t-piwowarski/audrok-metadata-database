/*
    File: 02_data_origins.sql
    Layer: SEEDS
    Purpose: insert seed data into the DataOrigin table

    Description:
    This script loads metadata describing original audio sources
    used in the AuDroK dataset.

    It includes:
    - YouTube sources
    - GitHub repositories
    - author-provided datasets
    - internal measurement datasets

    Notes:
    - run after 02_core_tables.sql
    - should be executed before ETL loading
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SEED LOAD: DATA ORIGINS';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.DataOrigin;

PRINT 'Table truncated: dronesounds.DataOrigin';

INSERT INTO dronesounds.DataOrigin (
	OriginID,
	Authors,
	SourceUrl,
	LicenseStatus,
	OriginRemarks
)
VALUES
	 (1,  N'Spinfast (Martin Bennat)', N'https://www.youtube.com/watch?v=06PaInWr84A', N'open', N'drone sound resected'),
	 (2,  N'Reveal Rabbit', N'https://www.youtube.com/watch?v=fotbFA-J1P0', N'open', N'drone sound resected'),
	 (3,  N'Reveal Rabbit', N'https://www.youtube.com/watch?v=fotbFA-J1P1', N'open', N'drone sound resected'),
	 (4,  N'Spinfast (Martin Bennat)', N'https://www.youtube.com/watch?v=06PaInWr84A', N'open', N'drone sound resected'),
	 (5,  N'Reveal Rabbit', N'https://www.youtube.com/watch?v=fotbFA-J1P2', N'open', N'drone sound resected'),
	 (6,  N'Reveal Rabbit', N'https://www.youtube.com/watch?v=fotbFA-J1P3', N'open', N'drone sound resected'),
	 (7,  N'Reveal Rabbit', N'https://www.youtube.com/watch?v=DCB9CqV_vEE', N'open', N'drone sound resected'),
	 (8,  N'digitec', N'https://www.youtube.com/watch?v=DCB9CqV_vEE', N'open', N'drone sound resected'),
	 (9,  N'Digitec', N'https://www.youtube.com/watch?v=DCB9CqV_vEE', N'open', N'drone sound resected'),
	 (10, N'Spinfast (Martin Bennat)', N'https://www.youtube.com/watch?v=bK83K0d_KXc', N'open', N'drone sound resected'),
	 (11, N'BlackstageDrohnenTipps', N'https://www.youtube.com/watch?v=eho4qTqBw2Y', N'open', N'drone sound resected'),
	 (12, N'BlackstageDrohnenTipps', N'https://www.youtube.com/watch?v=eho4qTqBw2Y', N'open', N'drone sound resected'),
	 (13, N'Dave', N'https://www.youtube.com/watch?v=TDeGSq8XDuY', N'open', N'drone sound resected'),
	 (14, N'Dave', N'https://www.youtube.com/watch?v=TDeGSq8XDuY', N'open', N'drone sound resected'),
	 (15, N'CopterPro', N'https://www.youtube.com/watch?v=AJ0ZENMJ5bI', N'open', N'drone sound resected'),
	 (16, N'CopterPro', N'https://www.youtube.com/watch?v=AJ0ZENMJ5bI', N'open', N'drone sound resected'),
	 (17, N'CopterPro', N'https://www.youtube.com/watch?v=AJ0ZENMJ5bI', N'open', N'drone sound resected'),
	 (18, N'spectaculAIR', N'https://www.youtube.com/watch?v=62KQil-1Z6M', N'open', N'drone sound resected / commercial drone version'),
	 (19, N'spectaculAIR', N'https://www.youtube.com/watch?v=62KQil-1Z6M', N'open', N'drone sound resected / commercial drone version'),
	 (20, N'spectaculAIR', N'https://www.youtube.com/watch?v=62KQil-1Z6M', N'open', N'drone sound resected / commercial drone version'),
	 (21, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (22, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (23, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (24, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (25, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (26, N'Arthur Konze', N'https://www.youtube.com/watch?v=m_fMKxxddNw', N'open', N'drone sound resected'),
	 (27, N'FunThomas', N'https://www.youtube.com/watch?v=Lqh-cGqZ6SU', N'open', N'drone sound resected'),
	 (28, N'ITRaidDE', N'https://www.youtube.com/watch?v=dBPPItaVvk8', N'open', N'drone sound resected'),
	 (29, N'Flying-SkyPics GbR', N'https://www.youtube.com/watch?v=xe9IQI9M0Uw', N'open', N'drone sound resected'),
	 (30, N'Flying-SkyPics GbR', N'https://www.youtube.com/watch?v=Hz4yqGmNdX0', N'open', N'drone sound resected / mixed with spraying sound'),
	 (31, N'How Farms Work (Youtube channel)', N'https://www.youtube.com/watch?v=OnsHYMlVmBQ', N'open', N'drone sound resected'),
	 (32, N'Agri Spray Drones (Youtube Channel)', N'https://www.youtube.com/watch?v=0FQ5KYtMyv8', N'open', N'drone sound resected'),
	 (33, N'U-Rob GmbH', N'https://www.youtube.com/watch?v=wGC_CMTBBAo', N'open', N'drone sound resected'),
	 (34, N'U-Rob-GmbH', N'https://www.youtube.com/watch?v=wGC_CMTBBAo', N'open', N'drone sound resected'),
	 (35, N'Reveal Rabbit', N'https://www.youtube.com/watch?v=KyZoJkAVdjI', N'open', N'drone sound resected'),
	 (36, N'Billy Kyle', N'https://www.youtube.com/watch?v=lIxI2XV331Q', N'open', N'drone sound resected'),
	 (37, N'Dmx Divyanshu', N'https://www.youtube.com/shorts/j4TTwLTY4fU', N'open', N'drone sound resected'),
	 (38, N'PIXELSAIR', N'https://www.youtube.com/watch?v=yhKeA9TFBYI', N'open', N'drone sound resected'),
	 (39, N'Universität des Saarlandes', N'https://www.golem.de/news/tricopter-saarbruecker-drohne-fliegt-mit-drei-rotoren-1304-98694.html', N'open', N'drone sound resected / record year 2013'),
	 (40, N'Billy Kyle', N'https://www.youtube.com/watch?v=t5lieUI308I', N'open', N'drone sound resected'),
	 (41, N'Billy Kyle', N'https://www.youtube.com/watch?v=aNMHaVKLbkQ', N'open', N'drone sound resected'),
	 (42, N'Matthias Dangl', N'https://www.youtube.com/watch?v=xA77U3JO2VM', N'open', N'drone sound resected'),
	 (43, N'Karol J. Piczak', N'https://github.com/karoldvl/ESC-50', N'open', N'recorded drone sounds+ noises'),
	 (44, N'S. Al-Emadi+ A. Al-Ali+ A. Mohamed', N'https://github.com/saraalemadi/DroneAudioDataset', N'open', N'generated and recorded sounds'),
	 (45, N'Drones Magazin', N'https://www.youtube.com/watch?v=Rg5g-hyV7sc', N'open', N'drone sound resected'),
	 (46, N'Reveal Rabbit', N'https://www.youtube.com/watch?v=Te9vEl-Qfek', N'open', N'drone sound resected'),
	 (47, N'dkameraTV', N'https://www.youtube.com/watch?v=xXOwWxzm5U8', N'open', N'drone sound resected'),
	 (48, N'TCBTS', N'https://www.youtube.com/watch?v=2ICGiJoSJxA', N'open', N'drone sound resected'),
	 (49, N'TMS Productions', N'https://www.youtube.com/watch?v=omqNCIDKZww', N'open', N'drone sound resected'),
	 (50, N'Svanström+ Englund Alonso-Fernandez', N'https://github.com/DroneDetectionThesis/Drone-detection-dataset/tree/master/Data', N'CC0 1.0', N'recorded drone sounds'),
	 (51, N'Pablo Alloza', N'see: 2020-SOUND LOCALIZATION OF DRONES USING AN ACOUSTIC CAMERA.pdf', N'data shared by author', N'courtesy of Pablo Alloza'),
	 (52, N'h2think gGmbH', N'AuDroK measurements 02-21-2023', N'public', N'Measured in anechoic room  (RAR) TU Dresden'),
	 (53, N'UBA-DLR-TUB', N'UBA in Koop. mit DLR - Institut für Flugführung und TU-Berlin Fachgebiet Flugführung und Luftverkehr', N'data shared by authors', N'drone noise measurements outdoor'),
	 (54, N'h2think gGmbH', N'AuDroK measurements 06-23-2023', N'public', N'Measured at Fraunhofer IVI in Dresden');
GO

PRINT 'Data origins inserted successfully';

DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.DataOrigin;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: DATA ORIGINS';
PRINT 'END';
PRINT '========================================';
GO