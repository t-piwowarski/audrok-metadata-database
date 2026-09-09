/*
    File: 02_clean_trim.sql
    Layer: STAGING
    Purpose: remove unnecessary whitespaces

    Description:
    This script removes leading and trailing spaces
    from string-based columns imported from raw sources.

    Notes:
    - fixes inconsistent formatting
    - does not modify business logic values
*/

PRINT '========================================';
PRINT 'STAGING CLEANUP: TRIM';
PRINT 'START';
PRINT '========================================';

UPDATE staging.AudioFile_Staging
SET
    FileName = LTRIM(RTRIM(FileName)),
    FileFormat = LTRIM(RTRIM(FileFormat)),
    DirectoryPath = LTRIM(RTRIM(DirectoryPath)),
    ProcessingStatusRaw = LTRIM(RTRIM(ProcessingStatusRaw)),
    ClassRaw = LTRIM(RTRIM(ClassRaw)),
    RotationUniformityRaw = LTRIM(RTRIM(RotationUniformityRaw)),
    DistanceRaw = LTRIM(RTRIM(DistanceRaw)),
    RemarksMeta = LTRIM(RTRIM(RemarksMeta));

PRINT 'Whitespace cleanup completed';

PRINT '========================================';
PRINT 'STAGING CLEANUP: TRIM';
PRINT 'END';
PRINT '========================================';
GO