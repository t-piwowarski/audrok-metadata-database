/*
    File: 07_load_audio_files.sql
    Layer: ETL
    Purpose: load normalized audio file records into the final AudioFile table

    Description:
    This script loads cleaned and standardized records from the staging layer
    into the final normalized dronesounds.AudioFile table. It maps raw staging
    values to lookup table identifiers and preserves only the final analytical
    structure.

    Notes:
    - run after all ETL mapping validation scripts
    - truncates final AudioFile table before reload
    - requires valid lookup mappings for class, origin, drone type, rotation,
      distance and processing status
*/

PRINT '========================================';
PRINT 'ETL LOAD: dronesounds.AudioFile';
PRINT 'START';
PRINT '========================================';


---------------------------------------------------
-- Safety: clear final table before reload
---------------------------------------------------
TRUNCATE TABLE dronesounds.AudioFile;

PRINT 'Final table truncated';


---------------------------------------------------
-- Insert normalized audio file data
---------------------------------------------------
INSERT INTO dronesounds.AudioFile (
    FileID,
    LegacyFileID,
    SourceTable,
    FileName,
    SamplingRateHz,
    FileFormat,
    Channels,
    DurationSec,
    DirectoryPath,
    OriginID,
    ProcessingStatusID,
    ClassID,
    DroneTypeID,
    RotationUniformityID,
    DistanceCategoryID,
    SignalQuality,
    RemarksMeta,
    MeasuredWeightKg
)
SELECT
    ROW_NUMBER() OVER (
        ORDER BY s.SourceTable, s.FileID
    ) AS FileID,

    s.FileID AS LegacyFileID,
    s.SourceTable,
    s.FileName,
    CAST(s.SamplingRateHz AS INT) AS SamplingRateHz,
    s.FileFormat,
    CAST(s.Channels AS TINYINT) AS Channels,
    CAST(s.DurationSec AS DECIMAL(10,3)) AS DurationSec,
    s.DirectoryPath,
    o.OriginID,
    ps.ProcessingStatusID,
    cc.ClassID,
    dt.DroneTypeID,
    ru.RotationUniformityID,
    dc.DistanceCategoryID,
    CAST(s.SignalQuality AS TINYINT) AS SignalQuality,
    s.RemarksMeta,
    CAST(s.MeasuredWeightKg AS DECIMAL(8,3)) AS MeasuredWeightKg
FROM staging.AudioFile_Staging s
INNER JOIN dronesounds.DataOrigin o
    ON s.OriginRaw = o.OriginID
INNER JOIN dronesounds.ProcessingStatus ps
    ON s.ProcessingStatusRaw = LOWER(ps.StatusName)
INNER JOIN dronesounds.ContentClass cc
    ON s.ClassRaw = cc.ClassID
INNER JOIN dronesounds.DroneType dt
    ON s.DroneTypeRaw = dt.DroneTypeID
INNER JOIN dronesounds.RotationUniformity ru
    ON s.RotationUniformityRaw = ru.RotationUniformityID
INNER JOIN dronesounds.DistanceCategory dc
    ON s.DistanceRaw = dc.DistanceCategoryID;

PRINT 'Insert into final AudioFile table completed';


---------------------------------------------------
-- Quick row count validation
---------------------------------------------------
DECLARE @FinalRowCount INT;
DECLARE @StagingRowCount INT;

SELECT @FinalRowCount = COUNT(*)
FROM dronesounds.AudioFile;

SELECT @StagingRowCount = COUNT(*)
FROM staging.AudioFile_Staging;

PRINT 'Rows in staging: ' + CAST(@StagingRowCount AS NVARCHAR(20));
PRINT 'Rows inserted into final AudioFile: ' + CAST(@FinalRowCount AS NVARCHAR(20));


---------------------------------------------------
-- Validate row count consistency
---------------------------------------------------
IF @FinalRowCount <> @StagingRowCount
BEGIN
    RAISERROR(
        'Final AudioFile row count does not match staging row count. Check lookup mappings and joins.',
        16,
        1
    );
    RETURN;
END;

PRINT 'Row count validation passed';


PRINT '========================================';
PRINT 'ETL LOAD: dronesounds.AudioFile';
PRINT 'END';
PRINT '========================================';
GO