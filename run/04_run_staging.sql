/*
    File: 04_run_staging.sql
    Layer: RUN
    Purpose: execute all STAGING layer scripts

    Description:
    This script consolidates raw source tables into a unified staging layer,
    applies cleaning operations, standardizes values and validates transformed data.

    Notes:
    - run after RAW layer
    - prepares data for ETL mapping
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'STAGING PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\staging\00_create_staging_tables.sql
:r .\staging\01_create_unified_source_view.sql
:r .\staging\02_load_staging_from_view.sql
:r .\staging\03_clean_trim.sql
:r .\staging\04_standardize_units.sql
:r .\staging\05_standardize_text_values.sql
:r .\staging\06_validate_staging.sql


PRINT '========================================';
PRINT 'STAGING PIPELINE';
PRINT 'END';
PRINT '========================================';
GO