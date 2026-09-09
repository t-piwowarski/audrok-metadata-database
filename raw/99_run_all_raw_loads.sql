/*
    File: 99_run_all_raw_loads.sql
    Layer: RAW
    Purpose: execute all RAW data load scripts

    Description:
    This script orchestrates the complete RAW data loading process
    by executing all individual source insert scripts.

    It loads original AuDroK source datasets into RAW tables
    without applying transformations.

    Notes:
    - run after 00_create_raw_tables.sql
    - requires SQLCMD mode enabled because of :r commands
    - executes all RAW source imports in correct order
*/

PRINT '========================================';
PRINT 'RAW PIPELINE: FULL LOAD';
PRINT 'START';
PRINT '========================================';


PRINT 'Loading: digitally mixed drone sounds...';
:r raw/data/01_insert_digitally_mixed.sql

PRINT 'Loading: multi-drone outdoor sounds...';
:r raw/data/02_insert_multi_dr_outdoor.sql

PRINT 'Loading: recorded background sounds...';
:r raw/data/03_insert_background.sql

PRINT 'Loading: short babble sounds...';
:r raw/data/04_insert_babble.sql

PRINT 'Loading: single drone freefield sounds...';
:r raw/data/05_insert_freefield.sql

PRINT 'Loading: outdoor noise drone sounds...';
:r raw/data/06_insert_outdoor_noise.sql

PRINT 'Loading: outdoor pure drone sounds...';
:r raw/data/07_insert_outdoor_pure.sql


PRINT '========================================';
PRINT 'RAW PIPELINE: FULL LOAD';
PRINT 'END';
PRINT '========================================';
GO