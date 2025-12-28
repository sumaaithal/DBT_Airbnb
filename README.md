# DBT_Airbnb

models/
```
  ├── staging/       
  Raw data standardization
  ├── intermediate/  
  Transformations and joins
  └── marts/         
  Final fact and dimension tables
```

##### Static reference datasets  
seeds/   
##### Historical tracking for SCD Type 2  
snapshots/
##### Data quality and integrity checks 
tests/
##### Reusable transformation logic  
macros/
##### Project configuration
dbt_project.yml       

## 🔗 Source SQL Modeling

Source SQL models define the entry point for raw Airbnb data already loaded into Snowflake. These sources act as a contract between ingestion and transformation layers.  

The source layer ensures: 

- Clear lineage from raw tables to downstream models  
- Consistent column naming and data types  
- Transparency and trust in upstream data

All staging and transformation models depend on these source definitions. 

## 🔄 Transformations

Transformations are applied in multiple layers to progressively refine the data:

### 📌 Staging Layer
Cleans and standardizes raw data — renaming columns, casting types, and applying basic filters. 

### 📌 Intermediate Layer
Applies business logic and combines multiple staging models. Handles joins, derived attributes, and reusable transformations. 

### 📌 Seed Data
A **dbt seed file** named `full_moon_date.csv` is loaded into Snowflake. This static data is used to enrich date-based analysis. 

## 🔁 Change Data Capture (CDC)

CDC is implemented to handle updates in key dimensional attributes, including:

- Changes to `host_name` in the hosts table  
- Updates to `maximum_nights` in the listings table 

Instead of overwriting records, historical values are preserved, enabling time-based reporting. 

## 🚀 Incremental Load Strategy

Incremental models allow efficient processing of large Airbnb datasets:

- Full table is created on the first run  
- Subsequent runs process only new or updated records  
- Improves runtime and reduces Snowflake compute costs 

## 📊 Fact and Dimension Modeling

### 🧱 Dimension Tables
Store descriptive attributes for slicing and filtering in analytics.

Examples:

- Hosts dimension with historical changes preserved  
- Listings dimension with property details  
- Date dimension enriched using the full moon seed data 

### 📦 Fact Tables
Store measurable business metrics and events.

Examples:

- Listing-level performance metrics  
- Review and availability metrics  
- Aggregated pricing and occupancy measures 

Fact tables reference dimension tables using consistent keys for performant analytical queries. 

## 📌 Summary

This dbt Airbnb project demonstrates a complete analytics engineering lifecycle:

- Raw data is accessed through source definitions  
- Reference data is managed using seeds  
- Transformations are applied in layered models  
- CDC preserves historical changes  
- Incremental loads optimize performance  
- Fact and dimension tables deliver analytics-ready outputs 

The result is a **scalable, maintainable, production-grade dbt project built on Snowflake**. 

---
