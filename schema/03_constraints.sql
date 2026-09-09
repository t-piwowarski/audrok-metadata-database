/*
    File: 03_constraints.sql
    Layer: SCHEMA
    Purpose: add foreign key constraints between core and lookup tables

    Description:
    This script creates foreign key relationships between the main
    AudioFile table and all referenced lookup/core tables.

    It enforces referential integrity across the normalized AuDroK model.

    Notes:
    - run after schema creation
    - run after seed data is loaded
    - execute after ETL validation if source data may contain inconsistencies
*/

PRINT '========================================';
PRINT 'SCHEMA SETUP: FOREIGN KEY CONSTRAINTS';
PRINT 'START';
PRINT '========================================';


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_DataOrigin'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_DataOrigin
        FOREIGN KEY (OriginID)
        REFERENCES dronesounds.DataOrigin(OriginID);

    PRINT 'Created FK: FK_AudioFile_DataOrigin';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_DroneType'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_DroneType
        FOREIGN KEY (DroneTypeID)
        REFERENCES dronesounds.DroneType(DroneTypeID);

    PRINT 'Created FK: FK_AudioFile_DroneType';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_ContentClass'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_ContentClass
        FOREIGN KEY (ClassID)
        REFERENCES dronesounds.ContentClass(ClassID);

    PRINT 'Created FK: FK_AudioFile_ContentClass';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_RotationUniformity'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_RotationUniformity
        FOREIGN KEY (RotationUniformityID)
        REFERENCES dronesounds.RotationUniformity(RotationUniformityID);

    PRINT 'Created FK: FK_AudioFile_RotationUniformity';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_DistanceCategory'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_DistanceCategory
        FOREIGN KEY (DistanceCategoryID)
        REFERENCES dronesounds.DistanceCategory(DistanceCategoryID);

    PRINT 'Created FK: FK_AudioFile_DistanceCategory';
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AudioFile_ProcessingStatus'
)
BEGIN
    ALTER TABLE dronesounds.AudioFile
    ADD CONSTRAINT FK_AudioFile_ProcessingStatus
        FOREIGN KEY (ProcessingStatusID)
        REFERENCES dronesounds.ProcessingStatus(ProcessingStatusID);

    PRINT 'Created FK: FK_AudioFile_ProcessingStatus';
END;
GO


PRINT '========================================';
PRINT 'SCHEMA SETUP: FOREIGN KEY CONSTRAINTS';
PRINT 'END';
PRINT '========================================';
GO