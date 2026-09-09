:ON ERROR EXIT
/*
    File: 99_run_full_etl.sql
    Layer: ETL
    Purpose: execute full ETL pipeline for loading final normalized data

    Description:
    This script runs all ETL validation and loading steps in the correct order.
    It prepares the ETL environment, validates mappings between staging and
    lookup tables, loads the final AudioFile table, and performs post-load
    validation.

    Notes:
    - run after schema, seeds, raw and staging scripts
    - requires SQLCMD Mode in SQL Server Management Studio
    - execute from the project root or adjust relative paths
*/

PRINT '========================================';
PRINT 'FULL ETL PIPELINE';
PRINT 'START';
PRINT '========================================';

:r .\etl\00_prepare_etl.sql
:r .\etl\01_map_content_classes.sql
:r .\etl\02_map_origins.sql
:r .\etl\03_map_drone_types.sql
:r .\etl\04_map_rotation_uniformity.sql
:r .\etl\05_map_distance_categories.sql
:r .\etl\06_map_processing_status.sql
:r .\etl\07_load_audio_files.sql
:r .\etl\08_validate_final_load.sql

PRINT '========================================';
PRINT 'FULL ETL PIPELINE';
PRINT 'END';
PRINT '========================================';
GO