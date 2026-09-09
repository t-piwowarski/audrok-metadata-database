/*
    File: 06_processing_statuses.sql
    Layer: SEEDS
    Purpose: insert seed data into ProcessingStatus lookup table

    Description:
    This script loads standardized processing states that describe
    how raw audio recordings were modified before entering the dataset.

    Notes:
    - used during ETL mapping process
    - maps legacy Proc_Status values
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SEED LOAD: PROCESSING STATUS';
PRINT 'START';
PRINT '========================================';


TRUNCATE TABLE dronesounds.ProcessingStatus;

PRINT 'Table truncated: dronesounds.ProcessingStatus';


INSERT INTO dronesounds.ProcessingStatus (
    ProcessingStatusID,
    StatusName
)
VALUES
    (1, N'Unchanged from source'),
    (2, N'Raw'),
    (3, N'Amplified f=10'),
    (4, N'Array average + amplified f=10'),
    (5, N'Ext.'),
    (6, N'T.B.D.'),
    (7, N'Preprocessed'),
    (8, N'Segmented'),
    (9, N'Augmented'),
    (10, N'Synthetic / mixed');
GO


PRINT 'Processing statuses inserted successfully';

DECLARE @RowCount INT;

SELECT @RowCount = COUNT(*)
FROM dronesounds.ProcessingStatus;

PRINT 'Rows inserted: ' + CAST(@RowCount AS NVARCHAR(20));


PRINT '========================================';
PRINT 'SEED LOAD: PROCESSING STATUS';
PRINT 'END';
PRINT '========================================';
GO