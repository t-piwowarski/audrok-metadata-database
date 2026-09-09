/*
    File: 00_create_database.sql
    Layer: DATABASE
    Purpose: create and select the DroneSoundsDB database

    Description:
    This script creates the main SQL Server database used for the AuDroK
    data processing project and switches the execution context to it.

    Notes:
    - run as the first script in the project
    - requires permission to create databases
    - execute before schema, seed, raw, staging, and ETL scripts
*/

PRINT '========================================';
PRINT 'DATABASE SETUP: DroneSoundsDB';
PRINT 'START';
PRINT '========================================';


IF DB_ID(N'DroneSoundsDB') IS NULL
BEGIN
    CREATE DATABASE DroneSoundsDB;
    PRINT 'Database created: DroneSoundsDB';
END
ELSE
BEGIN
    PRINT 'Database already exists: DroneSoundsDB';
END;
GO


USE DroneSoundsDB;
GO

PRINT 'Database selected: DroneSoundsDB';

PRINT '========================================';
PRINT 'DATABASE SETUP: DroneSoundsDB';
PRINT 'END';
PRINT '========================================';
GO