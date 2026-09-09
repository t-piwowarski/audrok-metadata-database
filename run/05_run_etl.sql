:ON ERROR EXIT
/*
    File: 05_run_etl.sql
    Layer: RUN
    Purpose: execute full ETL pipeline

    Description:
    This script runs the complete ETL process: preparation checks,
    mapping validation, final AudioFile loading, and post-load validation.

    Notes:
    - run after staging layer
    - loads data into the final normalized schema
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'ETL PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\etl\99_run_full_etl.sql


PRINT '========================================';
PRINT 'ETL PIPELINE';
PRINT 'END';
PRINT '========================================';
GO