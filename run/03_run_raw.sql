/*
    File: 03_run_raw.sql
    Layer: RUN
    Purpose: execute all RAW layer scripts

    Description:
    This script creates RAW tables and loads original AuDroK source data
    without any transformations or cleaning.

    Notes:
    - run after schema and seed layers
    - preserves original source structure
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'RAW LOAD PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\raw\00_create_raw_tables.sql
:r .\raw\99_run_all_raw_loads.sql


PRINT '========================================';
PRINT 'RAW LOAD PIPELINE';
PRINT 'END';
PRINT '========================================';
GO