/*
    File: 02_run_seeds.sql
    Layer: RUN
    Purpose: execute all seed data scripts

    Description:
    This script loads all reference and master data required
    by the ETL process and final database model.

    Notes:
    - run after schema creation
    - run before raw/staging/etl layers
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'SEED LOAD PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\seeds\01_content_classes.sql
:r .\seeds\02_data_origins.sql
:r .\seeds\03_drone_types.sql
:r .\seeds\04_distance_categories.sql
:r .\seeds\05_rotation_uniformity.sql
:r .\seeds\06_processing_statuses.sql


PRINT '========================================';
PRINT 'SEED LOAD PIPELINE';
PRINT 'END';
PRINT '========================================';
GO