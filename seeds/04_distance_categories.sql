/*
    File: 04_distance_categories.sql
    Layer: SEEDS
    Purpose: insert seed data into DistanceCategory lookup table

    Description:
    This script loads standardized distance categories used
    for drone audio metadata classification.

    Notes:
    - values originate from legacy AuDroK annotations
    - used during ETL mapping process
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SEED LOAD: DISTANCE CATEGORIES';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.DistanceCategory;

PRINT 'Table truncated: dronesounds.DistanceCategory';


INSERT INTO dronesounds.DistanceCategory (
    DistanceCategoryID,
    Meaning
)
VALUES
    (N'C', N'Close'),
    (N'M', N'Medium'),
    (N'D', N'Distant'),
    (N'V', N'Varying'),
    (N'X', N'Unknown / Unclear');
GO


PRINT 'Distance categories inserted successfully';

DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.DistanceCategory;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: DISTANCE CATEGORIES';
PRINT 'END';
PRINT '========================================';
GO