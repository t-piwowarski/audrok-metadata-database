/*
    File: 00_create_schema.sql
    Layer: SCHEMA
    Purpose: create the logical schema for the DroneSoundsDB project

    Description:
    This script creates the main application schema used to store
    normalized drone audio metadata tables.

    The schema separates business/domain objects from the default dbo schema
    and provides cleaner database organization.

    Notes:
    - run after 00_create_database.sql
    - must be executed before lookup/core table creation
    - safe to rerun
*/

PRINT '========================================';
PRINT 'SCHEMA SETUP: dronesounds';
PRINT 'START';
PRINT '========================================';


IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'dronesounds'
)
BEGIN
    EXEC('CREATE SCHEMA dronesounds');
    PRINT 'Schema created: dronesounds';
END
ELSE
BEGIN
    PRINT 'Schema already exists: dronesounds';
END;
GO


PRINT '========================================';
PRINT 'SCHEMA SETUP: dronesounds';
PRINT 'END';
PRINT '========================================';
GO