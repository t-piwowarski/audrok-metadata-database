# AuDroK Metadata Database

This repository contains SQL Server scripts used to reconstruct a normalized metadata database for the AuDroK drone acoustic dataset.

The database was prepared as part of a master's thesis focused on machine learning methods for drone detection based on acoustic signals.

## Purpose

The original metadata structure was distributed across several source tables. This made it difficult to perform consistent queries over the entire dataset. The goal of this repository is to provide a cleaned and normalized relational database structure that improves data consistency, enables global querying, and preserves the original metadata records.

The restructuring does not modify the original audio files. It only changes the way metadata are organized and loaded into a relational database.

## Database layers

The database build process follows a staged pipeline:

```text
RAW -> STAGING -> ETL -> FINAL
