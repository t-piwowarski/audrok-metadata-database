/*
    File: 01_diagnostic_queries.sql
    Layer: MAINTENANCE
    Purpose: provide diagnostic and exploratory queries for the final database

    Description:
    This script contains read-only diagnostic queries used to inspect
    the final normalized AuDroK database after the ETL pipeline has completed.

    Notes:
    - does not modify data
    - does not stop the pipeline
    - used for reporting, debugging, and exploratory analysis
    - run after /etl/08_validate_final_load.sql
*/

PRINT '========================================';
PRINT 'MAINTENANCE: DIAGNOSTIC QUERIES';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- 1. Count all audio files
---------------------------------------------------
PRINT 'Total number of audio files';

SELECT COUNT(*) AS TotalAudioFiles
FROM dronesounds.AudioFile;


---------------------------------------------------
-- 2. Count audio files by content class
---------------------------------------------------
PRINT 'Audio files by content class';

SELECT
    af.ClassID,
    cc.ClassName,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.ContentClass cc
    ON af.ClassID = cc.ClassID
GROUP BY
    af.ClassID,
    cc.ClassName
ORDER BY
    af.ClassID;


---------------------------------------------------
-- 3. Count audio files by drone type
---------------------------------------------------
PRINT 'Audio files by drone type';

SELECT
    af.DroneTypeID,
    dt.DroneTypeName,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.DroneType dt
    ON af.DroneTypeID = dt.DroneTypeID
GROUP BY
    af.DroneTypeID,
    dt.DroneTypeName
ORDER BY
    AudioFileCount DESC;


---------------------------------------------------
-- 4. Count audio files by data origin
---------------------------------------------------
PRINT 'Audio files by data origin';

SELECT
    af.OriginID,
    do.Authors,
    do.SourceUrl,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.DataOrigin do
    ON af.OriginID = do.OriginID
GROUP BY
    af.OriginID,
    do.Authors,
    do.SourceUrl
ORDER BY
    AudioFileCount DESC;


---------------------------------------------------
-- 5. Count audio files by processing status
---------------------------------------------------
PRINT 'Audio files by processing status';

SELECT
    af.ProcessingStatusID,
    ps.StatusName,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.ProcessingStatus ps
    ON af.ProcessingStatusID = ps.ProcessingStatusID
GROUP BY
    af.ProcessingStatusID,
    ps.StatusName
ORDER BY
    af.ProcessingStatusID;


---------------------------------------------------
-- 6. Signal quality distribution
---------------------------------------------------
PRINT 'Signal quality distribution';

SELECT
    SignalQuality,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile
GROUP BY SignalQuality
ORDER BY SignalQuality;


---------------------------------------------------
-- 7. Rotation uniformity distribution
---------------------------------------------------
PRINT 'Rotation uniformity distribution';

SELECT
    af.RotationUniformityID,
    ru.Meaning,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
LEFT JOIN dronesounds.RotationUniformity ru
    ON af.RotationUniformityID = ru.RotationUniformityID
GROUP BY
    af.RotationUniformityID,
    ru.Meaning
ORDER BY
    af.RotationUniformityID;


---------------------------------------------------
-- 8. Distance category distribution
---------------------------------------------------
PRINT 'Distance category distribution';

SELECT
    af.DistanceCategoryID,
    dc.Meaning,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
LEFT JOIN dronesounds.DistanceCategory dc
    ON af.DistanceCategoryID = dc.DistanceCategoryID
GROUP BY
    af.DistanceCategoryID,
    dc.Meaning
ORDER BY
    af.DistanceCategoryID;


---------------------------------------------------
-- 9. Sampling rate distribution
---------------------------------------------------
PRINT 'Sampling rate distribution';

SELECT
    SamplingRateHz,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile
GROUP BY SamplingRateHz
ORDER BY SamplingRateHz;


---------------------------------------------------
-- 10. Duration statistics
---------------------------------------------------
PRINT 'Duration statistics';

SELECT
    MIN(DurationSec) AS MinDurationSec,
    MAX(DurationSec) AS MaxDurationSec,
    AVG(DurationSec) AS AvgDurationSec
FROM dronesounds.AudioFile
WHERE DurationSec IS NOT NULL;


---------------------------------------------------
-- 11. Measured weight statistics
---------------------------------------------------
PRINT 'Measured weight statistics';

SELECT
    MIN(MeasuredWeightKg) AS MinMeasuredWeightKg,
    MAX(MeasuredWeightKg) AS MaxMeasuredWeightKg,
    AVG(MeasuredWeightKg) AS AvgMeasuredWeightKg
FROM dronesounds.AudioFile
WHERE MeasuredWeightKg IS NOT NULL;


---------------------------------------------------
-- 12. Files marked as No Drone
---------------------------------------------------
PRINT 'Audio files marked as No Drone';

SELECT
    af.FileID,
    af.FileName,
    af.ClassID,
    cc.ClassName,
    af.DroneTypeID,
    dt.DroneTypeName
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.ContentClass cc
    ON af.ClassID = cc.ClassID
INNER JOIN dronesounds.DroneType dt
    ON af.DroneTypeID = dt.DroneTypeID
WHERE af.DroneTypeID = 0
ORDER BY af.FileID;


---------------------------------------------------
-- 13. Drone recordings by class
---------------------------------------------------
PRINT 'Drone recordings by class';

SELECT
    af.ClassID,
    cc.ClassName,
    COUNT(*) AS AudioFileCount
FROM dronesounds.AudioFile af
INNER JOIN dronesounds.ContentClass cc
    ON af.ClassID = cc.ClassID
WHERE af.DroneTypeID <> 0
GROUP BY
    af.ClassID,
    cc.ClassName
ORDER BY
    af.ClassID;


---------------------------------------------------
-- 14. Potentially suspicious long recordings
---------------------------------------------------
PRINT 'Potentially suspicious long recordings';

SELECT
    FileID,
    FileName,
    DurationSec,
    SourceTable = NULL
FROM dronesounds.AudioFile
WHERE DurationSec IS NOT NULL
  AND DurationSec > 3600
ORDER BY DurationSec DESC;


---------------------------------------------------
-- 15. Potentially suspicious sampling rates
---------------------------------------------------
PRINT 'Potentially suspicious sampling rates';

SELECT
    FileID,
    FileName,
    SamplingRateHz
FROM dronesounds.AudioFile
WHERE SamplingRateHz NOT IN (8000, 16000, 22050, 32000, 44100, 48000, 96000)
ORDER BY SamplingRateHz;


PRINT '========================================';
PRINT 'MAINTENANCE: DIAGNOSTIC QUERIES';
PRINT 'END';
PRINT '========================================';
GO