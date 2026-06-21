
## Project Overview
An end-to-end data analytics project processing over 220,000 multi-platform records to analyze the pricing structures, regional market footprints, and consumer rating behavior between India's food delivery giants.

## Tech Stack
* **Data Engineering & Cleaning:** Python (Pandas)
* **Database Management & Staging:** SQL (MySQL, Joins, Window Functions, CTEs)
* **Data Modeling & Visualization:** Power BI, DAX, Power Query

## Project Workflow & Architecture

### 1. Data Cleaning & Feature Engineering (Python)
* Processed raw extractions (211.9K Zomato records, 8.6K Swiggy records) inside a Jupyter Notebook pipeline.
* Extracted and imputed structural data gaps (handled missing 'cuisines' and 'timings' values).
* Engineered categorical market-segment buckets via statistical binning (`cost_category` and `popularity` fields).

### 2. Database Staging & Performance Tuning (SQL)
* Developed high-speed `LOAD DATA LOCAL INFILE` streaming architecture to load datasets into SQL staging tables under 5 seconds.
* Written analytical views incorporating Common Table Expressions (CTEs) and Ranking functions to isolate top regional markets.

### 3. Business Intelligence Dashboard (Power BI & DAX)
* Normalised conflicting continuous decimal data ranges into synchronized distribution frameworks.
* Crafted high-impact visuals utilizing platform-specific typography (Zomato Crimson and Swiggy Orange) with cross-filtering components.

## Core Insights Isolated
* **Rating Convergence:** Over 92% of all restaurants on both platforms are tightly clustered in the mid-tier star segments, showing uniform baseline expectations.
* **Premium Scarcity:** Achieving perfect 5.0 ratings is equally restrictive across both competitive ecosystems, locking out ~92.4% of businesses.
