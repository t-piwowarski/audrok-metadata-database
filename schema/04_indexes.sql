/*
    File: 04_indexes.sql
    Layer: SCHEMA
    Purpose: create indexes for foreign keys and common filtering paths

    Description:
    This script creates nonclustered indexes on foreign key columns
    in the final AudioFile table to improve join performance and
    common filtering operations.

    Notes:
    - run after core tables are created
    - preferably run after foreign key constraints
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SCHEMA SETUP: INDEXES';
PRINT 'START';
PRINT '========================================';


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_OriginID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_OriginID
        ON dronesounds.AudioFile (OriginID);

    PRINT 'Created index: IX_AudioFile_OriginID';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_DroneTypeID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_DroneTypeID
        ON dronesounds.AudioFile (DroneTypeID);

    PRINT 'Created index: IX_AudioFile_DroneTypeID';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_ClassID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_ClassID
        ON dronesounds.AudioFile (ClassID);

    PRINT 'Created index: IX_AudioFile_ClassID';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_ProcessingStatusID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_ProcessingStatusID
        ON dronesounds.AudioFile (ProcessingStatusID);

    PRINT 'Created index: IX_AudioFile_ProcessingStatusID';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_RotationUniformityID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_RotationUniformityID
        ON dronesounds.AudioFile (RotationUniformityID);

    PRINT 'Created index: IX_AudioFile_RotationUniformityID';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_AudioFile_DistanceCategoryID'
      AND object_id = OBJECT_ID(N'dronesounds.AudioFile')
)
BEGIN
    CREATE INDEX IX_AudioFile_DistanceCategoryID
        ON dronesounds.AudioFile (DistanceCategoryID);

    PRINT 'Created index: IX_AudioFile_DistanceCategoryID';
END;
GO


PRINT '========================================';
PRINT 'SCHEMA SETUP: INDEXES';
PRINT 'END';
PRINT '========================================';
GO