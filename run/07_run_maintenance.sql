/*
    File: 06_run_maintenance.sql
    Layer: RUN
    Purpose: execute maintenance and diagnostic scripts

    Description:
    This script runs post-load validation and diagnostic queries
    used to inspect final database quality after the ETL process.

    Notes:
    - run after ETL completion
    - does not modify production data
    - used for diagnostics and manual verification
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'MAINTENANCE PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\maintenance\01_diagnostic_queries.sql


PRINT '========================================';
PRINT 'MAINTENANCE PIPELINE';
PRINT 'END';
PRINT '========================================';
GO