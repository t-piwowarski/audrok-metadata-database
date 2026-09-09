/*
    File: 05_rotation_uniformity.sql
    Layer: SEEDS
    Purpose: insert seed data into RotationUniformity lookup table

    Description:
    This script loads standardized rotor speed behavior categories
    used for drone acoustic metadata classification.

    Notes:
    - values originate from legacy AuDroK annotations
    - used during ETL mapping process
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SEED LOAD: ROTATION UNIFORMITY';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.RotationUniformity;

PRINT 'Table truncated: dronesounds.RotationUniformity';


INSERT INTO dronesounds.RotationUniformity (
    RotationUniformityID,
    Meaning
)
VALUES
    (N'C', N'Nearly constant'),
    (N'I', N'Increasing'),
    (N'D', N'Decreasing'),
    (N'V', N'Varying'),
    (N'X', N'Unknown / Unclear');
GO


PRINT 'Rotation uniformity categories inserted successfully';

DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.RotationUniformity;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: ROTATION UNIFORMITY';
PRINT 'END';
PRINT '========================================';
GO