# DBT_Airbnb

models/
  ├── staging/       # Raw data standardization
  ├── intermediate/  # Transformations and joins
  └── marts/         # Final fact and dimension tables

seeds/                # Static reference datasets  
snapshots/            # Historical tracking for SCD Type 2  
tests/                # Data quality and integrity checks  
macros/               # Reusable transformation logic  
dbt_project.yml       # Project configuration
```  [oai_citation:6‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 🔗 Source SQL Modeling

Source SQL models define the entry point for raw Airbnb data already loaded into Snowflake. These sources act as a contract between ingestion and transformation layers.  [oai_citation:7‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

The source layer ensures:  [oai_citation:8‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

- Clear lineage from raw tables to downstream models  
- Consistent column naming and data types  
- Transparency and trust in upstream data  [oai_citation:9‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

All staging and transformation models depend on these source definitions.  [oai_citation:10‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 🔄 Transformations

Transformations are applied in multiple layers to progressively refine the data:

### 📌 Staging Layer
Cleans and standardizes raw data — renaming columns, casting types, and applying basic filters.  [oai_citation:11‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

### 📌 Intermediate Layer
Applies business logic and combines multiple staging models. Handles joins, derived attributes, and reusable transformations.  [oai_citation:12‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

### 📌 Seed Data
A **dbt seed file** named `full_moon_date.csv` is loaded into Snowflake. This static data is used to enrich date-based analysis.  [oai_citation:13‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 🔁 Change Data Capture (CDC)

CDC is implemented to handle updates in key dimensional attributes, including:

- Changes to `host_name` in the hosts table  
- Updates to `maximum_nights` in the listings table  [oai_citation:14‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

Instead of overwriting records, historical values are preserved, enabling time-based reporting.  [oai_citation:15‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 🚀 Incremental Load Strategy

Incremental models allow efficient processing of large Airbnb datasets:

- Full table is created on the first run  
- Subsequent runs process only new or updated records  
- Improves runtime and reduces Snowflake compute costs  [oai_citation:16‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 📊 Fact and Dimension Modeling

### 🧱 Dimension Tables
Store descriptive attributes for slicing and filtering in analytics.

Examples:

- Hosts dimension with historical changes preserved  
- Listings dimension with property details  
- Date dimension enriched using the full moon seed data  [oai_citation:17‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

### 📦 Fact Tables
Store measurable business metrics and events.

Examples:

- Listing-level performance metrics  
- Review and availability metrics  
- Aggregated pricing and occupancy measures  [oai_citation:18‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

Fact tables reference dimension tables using consistent keys for performant analytical queries.  [oai_citation:19‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

## 📌 Summary

This dbt Airbnb project demonstrates a complete analytics engineering lifecycle:  [oai_citation:20‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

- Raw data is accessed through source definitions  
- Reference data is managed using seeds  
- Transformations are applied in layered models  
- CDC preserves historical changes  
- Incremental loads optimize performance  
- Fact and dimension tables deliver analytics-ready outputs  [oai_citation:21‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

The result is a **scalable, maintainable, production-grade dbt project built on Snowflake**.  [oai_citation:22‡GitHub](https://github.com/sumaaithal/DBT_Airbnb)

---
