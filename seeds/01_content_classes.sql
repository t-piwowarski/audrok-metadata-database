/*
    File: 01_content_classes.sql
    Layer: SEEDS
    Purpose: insert seed data into the content class lookup table

    Description:
    This script loads predefined audio content classifications
    used to categorize drone sound recordings in the final model.

    Notes:
    - run after schema lookup tables are created
    - should be executed before ETL mapping
    - values must remain stable for referential consistency
*/

PRINT '========================================';
PRINT 'SEED LOAD: CONTENT CLASSES';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.ContentClass;

PRINT 'Table truncated: dronesounds.ContentClass';


INSERT INTO dronesounds.ContentClass (
    ClassID,
    ClassName,
    Description
)
VALUES
    ('A', N'Single drone free-field sound', 
        N'Single drone free-field sound'),

    ('B', N'Single drone outdoor sound (pure)', 
        N'Single drone outdoor sound (pure)'),

    ('C', N'Single drone outdoor sound with noise/disturbances', 
        N'Single drone outdoor sound outdoor with noise and disturbances'),

    ('D', N'Multiple drone free-field sound', 
        N'More than one drone, free-field'),

    ('E', N'Multiple drone outdoor sound (pure)', 
        N'More than one drone, outdoor, pure'),

    ('F', N'Multiple drone outdoor sound with noise/disturbances', 
        N'More than one drone, outdoor, noisy'),

    ('G', N'Digitally mixed drone sounds', 
        N'Digitally mixed drones, noises, babble'),

    ('H', N'Recorded background sounds only', 
        N'Background or ambient recorded sounds'),

    ('I', N'Recorded short-period babble sounds', 
        N'Short babble sounds');
GO


PRINT 'Content classes inserted successfully';


DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.ContentClass;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: CONTENT CLASSES';
PRINT 'END';
PRINT '========================================';
GO