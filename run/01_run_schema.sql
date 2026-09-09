/*
    File: 01_run_schema.sql
    Layer: RUN
    Purpose: execute all schema creation scripts

    Description:
    This script creates the database structure required for the project:
    database creation, schema creation, lookup tables, and core tables.

    Notes:
    - run before seeds, raw, staging, and ETL layers
    - intended for schema rebuild only
    - requires SQLCMD Mode enabled
*/

PRINT '========================================';
PRINT 'SCHEMA BUILD PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\schema\00_create_database.sql
:r .\schema\00_create_schema.sql
:r .\schema\01_lookup_tables.sql
:r .\schema\02_core_tables.sql


PRINT '========================================';
PRINT 'SCHEMA BUILD PIPELINE';
PRINT 'END';
PRINT '========================================';
GO