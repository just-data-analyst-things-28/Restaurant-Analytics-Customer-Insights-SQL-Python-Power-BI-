
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

📈 Key Insights & Marketplace Dynamics
Core Insights Isolated
•	Symmetric Rating Convergence: Normalizing user sentiment across both competitive platforms reveals that over 92% of all restaurants are tightly clustered within the 3.0 to 4.0-star middle-tier segments. This statistical convergence indicates a highly standardized consumer baseline expectation, proving that despite separate digital ecosystems, core market satisfaction behaves identically. 
•	Premium Tier Scarcity (Top-End Restrictiveness): Achieving an absolute 5.0-star rating represents an exceptionally high operational barrier to entry, restricted to just 7.63% of venues on Swiggy and 7.55% on Zomato. This uniform scarcity (~92.4% exclusion rate) mathematically proves that peak consumer validation is distinct from normal variance and heavily restricted across both networks. 
Strategic Marketplace Dynamics & Footprint Insights
•	Asymmetric Footprint and Discovery vs. Delivery Models: The baseline dataset reveals a massive structural variance in data scope, with Zomato’s footprint capturing 211.94K restaurants compared to Swiggy’s high-density delivery snapshot of 8,680. This asymmetry indicates that Zomato serves as a broader historical discovery registry and wide-funnel marketplace directory, whereas Swiggy’s dataset represents an optimized, active, high-volume delivery sub-network. 
•	Hyper-Local Swiggy Footprint Dominance (The Kolkata Anomaly): While Zomato's transaction and review engagement is predictably concentrated in the mega-metro hubs of Mumbai (11.38% of total votes) and Bangalore (11.05%), Swiggy displays an intense regional footprint anomaly. Kolkata captures Swiggy’s highest relative consumer engagement share nationwide at 15.66%. This statistical spike identifies a deeply rooted, platform-specific consumer loyalty in the eastern market, proving that regional platform stickiness can defy national volume trends. 
•	Value-Driven Supply Strategy vs. Premium Monetization: The marketplace price segmentation donut charts show an intense divergence in supply strategy. Swiggy's ecosystem is heavily optimized for the value layer, with Budget dining making up a staggering 88.5% of its total restaurant supply. Conversely, Zomato maintains a significantly larger footprint in the Mid-Range (18.37%), Premium (8.65%), and Luxury segments. This variance shows that while Swiggy uses hyper-budget availability to capture rapid delivery volume, Zomato leverages higher-tier price diversity to drive premium monetization and average transaction value (AOV). 

