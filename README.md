# Online Retail Revenue
## Background and Overview
This project is completed as part of a Tata Group job simulation hosted on the Forage website. The objective of the simulation is to approach data analysis from a business-leader perspective, focusing not only on technical execution but also on strategic thinking, clear communication, and actionable insights.

#### Throughout the project, I practiced:

•	Understanding business context before performing any analysis

•	Identifying the most effective visualizations to communicate insights clearly

•	Designing visuals that directly answer leadership questions from the CEO and CMO

#### Key Business Questions:

1.  What are the top-selling products?
2.	What is the monthly trend of revenue? Which months show the largest increases or decreases? (for the year 2011 only)
3.	Which regions generate the highest and lowest revenue? (Exclude United Kingdom)
4.	What percentage of customers are repeating their orders?
6.	Who are the top customers and how much do they contribute to total revenue? Is revenue concentrated among a few customers, or is the customer base diversified?


#### Data Source

• Forage Simulation - Tata Data Visualisation: <a href="https://www.theforage.com/simulations/tata/data-visualisation-p5xo">link</a>

• Raw Dataset: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Online%20Retail.xlsx"> Link</a>.

#### Tools Used

•	SQL: Data inspection, schema validation, cleaning, and exploratory data analysis (EDA).

•	Tableau: Visual analytics, interactive dashboard development, and storyboarding.

•	Draw.io: Initial user interface layout and dashboard wireframing.

•	Flaticon & Paint: Custom icon sourcing, asset design, and dashboard visual editing.

#### Project Assets

• The initial dashboard mockup: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Mockup.pdf">view here</a>

•	Interactive Tableau Dashboard: <a href="https://public.tableau.com/app/profile/xuan.dinh8619/viz/Dashboard_17631801712060/DashboardOverview">view here</a>

•	SQL Scripts for Data Preparation: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Data%20Cleaning.sql">view here</a>

•	SQL Queries for Business Questions: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Data%20Analyzing.sql">view here</a>

#### Data Structure Overview
This is a transactional dataset containing all online retail transactions between 01/12/2010 and 09/12/2011 for a UK-based, non-store online retail business.

InvoiceNo: Categorical

StockCode:	Categorical

Description:	Categorical

Quantity:	Integer

InvoiceDate:	Date

UnitPrice:	Continuous

CustomerID:	Categorical

Country:	Categorical

## Executive Summary
### Overview of Findings
Overall, the enterprise generated $10.7M in revenue during the analysis period, revealing significant concentration across customers, geographic regions, and product lines. A small number of high-value accounts and international countries drive the vast majority of revenue, while top-selling products are primarily fueled by isolated bulk orders from key accounts rather than broad-based consumer demand.

Monthly revenue exhibited substantial volatility throughout the year. On a positive note, core customer engagement remains healthy, with 64% of accounts demonstrating repeat purchasing behavior. Below is a snapshot from the Tableau dashboard; the full interactive dashboard can be downloaded
<a href="https://public.tableau.com/app/profile/xuan.dinh8619/viz/Dashboard_17631801712060/DashboardOverview">here</a>.

<p align="center">
<img width="1100" height="650" alt="image" src="https://github.com/user-attachments/assets/469bd928-f68a-4661-a6b8-0b79a2036041" />
</p>

#### 1. Product-Level Quantity Sold<p align="center">

<p align="center">
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/13b7b11d-065c-4338-b41f-35d9115f8931" />
</p>

<p align="center">
<img width="450" height="100" alt="image" src="https://github.com/user-attachments/assets/857510b9-e45b-421e-a2a6-9c8b3026a394" />
</p>

The two best-selling products by volume are Paper Craft, Little Birdie (Product 23843) with 80,995 units sold ($168K revenue), and Medium Ceramic Top Storage Jar (Product 23166) with 78,033 units sold ($78K revenue). However, granular transaction-level auditing reveals that these high volumes were driven by isolated, exceptionally large bulk orders rather than broad-based market demand.
Specifically, a single bulk order for Product 23843 was placed in December by Customer 14646 (UK), while Customer 12346 (UK) drove Product 23166 volumes via a single massive January purchase. Because these metrics reflect concentrated, single-instance corporate purchasing rather than consistent market traction, relying on them for standard inventory planning or cash flow forecasting presents severe operational risks.
Conversely, the remaining top-5 products (22197, 84077, and 85099B) demonstrate resilient, distributed sales velocities across a wide customer base, indicating broader market appeal and more stable demand patterns.

#### 2. Monthly Revenue Trends
<p align="center">
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/a13fc508-5544-4e99-a8ec-ffd8709f10e1" />
</p>

In 2011, monthly revenue exhibited significant volatility around an $820K baseline, shifting from an extended slow period into a dramatic year-end spike. For the first eight months, revenue stagnated below average, hitting its lowest trough in February. However, performance accelerated sharply through Q3 and peaked at $1.5M in November, driven by concentrated holiday demand.
This peak was immediately followed by a steep 58% contraction to $639K in December. (Note: This contraction reflects the fact that December data only tracks through December 9). Ultimately, this heavy reliance on late-autumn volume creates an unstable monthly cash flow pattern rather than a steady, predictable revenue baseline.

#### 3. International Market Revenue Concentration
International markets display extreme revenue concentration risk. The Netherlands and Ireland lead international revenue at over $280K each, but this performance is deceptively fragile:
•	The Netherlands: A single key account drives $280K of the country's $285K total revenue (98%).
•	Ireland: Just two customers account for $261K of the country's $283K total revenue (92%).
These three customers rank among the company's largest accounts globally, meaning international revenue hinges almost entirely on retaining a handful of high-value relationships. The loss of any single account would effectively eliminate that country's revenue contribution.

Conversely, countries like Saudi Arabia, Bahrain, and the Czech Republic each generated less than $1K, indicating very limited market penetration. This highlights a core structural dependency: the domestic UK market (representing 90% of all accounts) provides baseline volume, while international expansion relies on a dangerously narrow client base.

#### 4. Customer Retention and Repeat Purchases
Customer behavior demonstrates strong baseline engagement, with approximately 64% of customers making repeat purchases during the analysis period. Nearly two-thirds of the customer base returned for at least one additional transaction, confirming solid brand loyalty and providing a foundation for revenue stability. However, the remaining 36% represent one-time buyers, highlighting a clear optimization gap where targeted lifecycle marketing could capture secondary conversions.

#### 5. Customer Concentration and Pareto Analysis
<p align="center">
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/b9487d5b-1397-4d4b-824c-e5ab5615b877" />
</p>
A Pareto analysis reveals that 26% of customers (1,133 of 4,339) contribute 80% of total revenue, confirming a significant baseline concentration. However, this concentration is distributed rather than extreme: the top 10 customers generate approximately $1.5M (14% of total revenue), led by Customer 14646 (Netherlands) at $280K and Customer 18102 (UK) at $260K.

This pattern indicates that the business depends on a substantial cohort of moderately high-value customers rather than a few dominant "whale" accounts. While this distribution minimizes the risk of a single catastrophic account departure, it still requires close monitoring given that one-quarter of the customer base dictates the vast majority of top-line revenue.

## Recommendations
1. Implement Risk Management for Bulk-Order Products:
Because high-volume products like 23843 and 23166 rely heavily on concentrated, single-instance purchases, treating them as standard inventory items poses a severe risk of over-purchasing and dead stock. It is recommended that management transition these specific SKUs strictly to an ad-hoc, on-demand fulfillment model. Core capital allocation and stock depth should be redirected toward products 22197, 84077, and 85099B, which exhibit highly predictable, decentralized consumption patterns.
2. Establish a Longitudinal Seasonal Baseline and Adopt Rolling Forecasts:
Given that the 2011 data represents a single annual cycle, establishing a definitive seasonal baseline requires further multi-year data validation. It is recommended that the organization closely monitor monthly revenue variance over the next 24 to 36 months to confirm true cyclical seasonality versus isolated annual anomalies.
To mitigate cash flow volatility in the interim, management should execute a targeted transactional audit of the November 2011 spike to determine if it indicates repeatable Q4 consumer demand or a non-recurring corporate account. Concurrently, the business should transition from rigid annual budgeting to monthly rolling forecasts, updating revenue projections using real-time sales data to maximize operational agility.
3. Standardize Post-Purchase Workflows to Convert One-Time Buyers
To optimize the 36% one-time buyer segment, the organization must implement targeted lifecycle retention strategies. It is recommended to deploy automated follow-up cadences, personalized product recommendations, and tailored loyalty incentives designed to lower acquisition friction and capture secondary conversions. Concurrently, management should execute a diagnostic behavioral analysis of the established repeat-customer segment to isolate the primary catalysts driving brand loyalty and systematically replicate those behaviors across new accounts.
4. Execute a Dual Strategy of Market Expansion and Portfolio Protection
To mitigate revenue concentration risk, the organization should execute a balanced growth-and-retention strategy by deploying targeted client acquisition frameworks alongside dedicated Key Account Management workflows for high-value accounts. Concurrently, management should optimize resource allocation by divesting from low-yield, under $1K markets, specifically Saudi Arabia, Bahrain, and the Czech Republic. These underutilized assets should be systematically reallocated to high-potential, high-velocity regions.



















