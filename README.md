# DBT_Airbnb

This repository contains a dbt (Data Build Tool) project that transforms raw Airbnb data into analytics-ready datasets using Snowflake as the data warehouse. The project follows dbt best practices and demonstrates an end-to-end analytics engineering workflow.


📌 Project Overview

The goal of this project is to build a scalable and maintainable analytics pipeline for Airbnb data. Raw source tables are standardized, enriched, and modeled into final fact and dimension tables that support reporting and analytical use cases.

Key concepts implemented in this project include:
	•	Source SQL modeling using dbt sources
	•	Layered transformations (staging, intermediate, marts)
	•	Seed-based reference data loading
	•	Change Data Capture (CDC) using SCD Type 2
	•	Incremental data processing for performance optimization
	•	Fact and dimension table design


📂 Repository Structure

The project is organized using a layered dbt structure:
	•	models/
	•	staging: raw data standardization
	•	intermediate: transformations and joins
	•	marts: final fact and dimension tables
	•	seeds/
	•	static reference datasets
	•	snapshots/
	•	historical tracking for SCD Type 2
	•	tests/
	•	data quality and integrity checks
	•	macros/
	•	reusable transformation logic
	•	dbt_project.yml
	•	project configuration


🔌 Source SQL Modeling

Source SQL models define the entry point for raw Airbnb data already loaded into Snowflake. These sources act as a contract between ingestion and transformation layers.

The source layer ensures:
	•	Clear lineage from raw tables to downstream models
	•	Consistent column naming and data types
	•	Transparency and trust in upstream data

All staging and transformation models depend on these source definitions.

🔄 Transformations

Transformations are applied in multiple layers to progressively refine the data.

Staging Layer

The staging layer cleans and standardizes raw data. This includes renaming columns, casting data types, and applying basic filters. The goal is to make raw data predictable and consistent for downstream processing.

Intermediate Layer

Intermediate models apply business logic and combine multiple staging models. This layer handles joins, derived attributes, and reusable transformations while keeping logic modular.

🌱 Seed Data (full_moon_date.csv)

This project uses a dbt seed file named full_moon_date.csv, which is loaded into the Snowflake warehouse.

The seed provides reference data used to enrich date-based analysis. By managing this data as a seed:
	•	Reference data is version-controlled using Git
	•	Consistent data is available across environments
	•	No external dependency is required for static lookup data

Once loaded, the seed behaves like a native Snowflake table and can be used in transformations.

🔄 Change Data Capture (CDC)

The project implements Change Data Capture to handle updates in key dimensional attributes, including:
	•	Changes to host_name in the hosts table
	•	Updates to maximum_nights in the listings table

Instead of overwriting records, historical values are preserved. This allows analytics to reflect attribute values accurately at any point in time and supports time-based reporting.

CDC ensures data traceability and prevents loss of historical context.

🕒 Incremental Load Strategy

Incremental models are used to efficiently process growing Airbnb datasets.

The incremental approach works as follows:
	•	A full table is created on the first run
	•	Subsequent runs process only new or updated records

This significantly reduces runtime and Snowflake compute costs, making the pipeline scalable for large datasets such as listings, availability, and reviews.


🧱 Fact and Dimension Modeling

The final analytics layer follows a dimensional modeling approach.

Dimension Tables

Dimension tables store descriptive attributes and are designed for slicing and filtering in analytics.

Examples include:
	•	Hosts dimension, tracking host attributes with historical changes preserved
	•	Listings dimension, containing property details such as room type and maximum nights
	•	Date dimension, enriched using the full moon seed data

Dimensions are stable, reusable, and CDC-aware.

Fact Tables

Fact tables store measurable business metrics and events.

Examples include:
	•	Listing-level performance metrics
	•	Review and availability metrics
	•	Aggregated pricing and occupancy measures

Fact tables reference dimension tables using consistent keys, enabling performant and reliable analytical queries.


📌 Summary

This dbt Airbnb project demonstrates a complete analytics engineering lifecycle:
	•	Raw data is accessed through source definitions
	•	Reference data is managed using seeds
	•	Transformations are applied in layered models
	•	CDC preserves historical changes
	•	Incremental loads optimize performance
	•	Fact and dimension tables deliver analytics-ready outputs

The result is a scalable, maintainable, and production-grade dbt project built on Snowflake.


