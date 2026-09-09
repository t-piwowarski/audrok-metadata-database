/*
    File: 06_finalize_schema.sql
    Layer: RUN
    Purpose: apply final constraints and indexes

    Description:
    This script applies foreign key constraints and performance indexes
    after successful ETL loading.

    Notes:
    - run after ETL
    - prevents load failures caused by temporary inconsistencies
    - improves query performance after bulk inserts
*/

PRINT '========================================';
PRINT 'FINALIZE SCHEMA PIPELINE';
PRINT 'START';
PRINT '========================================';


:r .\schema\03_constraints.sql
:r .\schema\04_indexes.sql


PRINT '========================================';
PRINT 'FINALIZE SCHEMA PIPELINE';
PRINT 'END';
PRINT '========================================';
GO