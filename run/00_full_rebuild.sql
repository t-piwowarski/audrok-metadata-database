:ON ERROR EXIT
/*
    File: 00_full_rebuild.sql
    Layer: RUN
    Purpose: execute complete database rebuild and data load pipeline

    Description:
    This script runs the full AuDroK database build process in the correct order:
    database setup, schema creation, seed loading, raw loading, staging,
    ETL loading, constraints, indexes, and final diagnostics.

    Notes:
    - requires SQLCMD Mode because of :r commands
    - execute from the project root
    - intended for full rebuilds
*/

PRINT '========================================';
PRINT 'FULL DATABASE REBUILD PIPELINE';
PRINT 'START';
PRINT '========================================';

:r .\schema\00_create_database.sql
:r .\schema\00_create_schema.sql
:r .\schema\01_lookup_tables.sql
:r .\schema\02_core_tables.sql

:r .\seeds\01_content_classes.sql
:r .\seeds\02_data_origins.sql
:r .\seeds\03_drone_types.sql
:r .\seeds\04_distance_categories.sql
:r .\seeds\05_rotation_uniformity.sql
:r .\seeds\06_processing_statuses.sql

:r .\raw\00_create_raw_tables.sql
:r .\raw\99_run_all_raw_loads.sql

:r .\staging\00_create_staging_tables.sql
:r .\staging\01_create_unified_source_view.sql
:r .\staging\02_load_staging_from_view.sql
:r .\staging\03_clean_trim.sql
:r .\staging\04_standardize_units.sql
:r .\staging\05_standardize_text_values.sql
:r .\staging\06_validate_staging.sql

:r .\etl\99_run_full_etl.sql

:r .\schema\03_constraints.sql
:r .\schema\04_indexes.sql

:r .\maintenance\01_diagnostic_queries.sql

PRINT '========================================';
PRINT 'FULL DATABASE REBUILD PIPELINE';
PRINT 'END';
PRINT '========================================';
GO