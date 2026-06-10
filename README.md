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

•	SQL: Data inspection, cleaning, preparation, and exploration

•	Tableau: Visual analytics and dashboard development

•	Draw.io: The initial dashboard mockup

•	 Flaticon: Icon sourcing for dashboard visuals

•	Paint: Icon customization and editing

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
Overall, the company generated $10.7M in revenue during the analysis period, with significant concentration across customers, regions, and products. A small number of high-value customers and countries drive the majority of revenue, while top-selling products are primarily fueled by bulk orders from key accounts rather than broad-based demand. Monthly revenue exhibited significant volatility. Customer engagement is strong, with 64% placing repeat orders. Below is a snapshot from the Tableau dashboard; the full interactive dashboard can be downloaded
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

The two best-selling products are Paper Craft, Little Birdie (Product 23843) with 80,995 units sold generating $168K, and Medium Ceramic Top Storage Jar (Product 23166) with 78,033 units sold generating $78K. However, a closer examination reveals that these high volumes are driven by a small number of exceptionally large orders rather than broad-based demand.
Specifically, a single bulk order of Product 23843 was placed in December by Customer 14646 (UK), while Customer 12346 (UK) drove Product 23166 volumes with a large January order. This pattern indicates that these products' top-selling status reflects concentrated bulk purchasing rather than consistent demand across our customer base. This makes their performance unreliable for inventory planning and cash flow forecasting.
Conversely, other top-5 products (22197, 84077, and 85099B) show distributed sales across numerous customers rather than bulk order concentration, indicating broader market appeal and more stable demand patterns.

#### 2. Monthly Revenue Trends
<p align="center">
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/a13fc508-5544-4e99-a8ec-ffd8709f10e1" />
</p>

In 2011, monthly revenue exhibited significant volatility around an $820K baseline, shifting from an extended slow period into a dramatic year-end spike. For the first eight months, revenue stagnated below average, hitting its lowest trough in February. However, performance accelerated sharply through Q3 and peaked at $1.5M in November, driven by concentrated holiday demand. This peak was immediately followed by a severe 58% contraction to $639K in December, reflecting a typical post-holiday slowdown. Ultimately, this heavy reliance on late-autumn volume creates an unstable monthly cash flow rather than steady, predictable revenue.

#### 3. International Market Revenue Concentration
International markets show extreme revenue concentration risk. The Netherlands and Ireland lead international revenue at over $280K each, but this performance is deceptively fragile:

• Netherlands: A single customer accounts for $280K of the $285K total (98%)

• Ireland: Two customers drive $261K of the $283K total (92%)

These three customers rank among the company's largest accounts globally, meaning international revenue hinges almost entirely on retaining a handful of high-value relationships. The loss of any one account would effectively eliminate that country's revenue contribution.

At the other end of the spectrum, countries like Saudi Arabia, Bahrain, and the Czech Republic each generated less than $1K, indicating very limited market penetration.

The company's customer base remains overwhelmingly domestic, with 3,921 of 4,339 customers (90%) located in the UK. This creates a structural dependency: domestic markets provide volume, while international performance relies on a dangerously narrow client base vulnerable to concentration risk.

#### 4. Customer Retention and Repeat Purchases
Customer behavior demonstrates strong engagement, with approximately 64% making repeat purchases during the analysis period. Nearly two-thirds of customers returned for at least one additional transaction, contributing to revenue stability and indicating positive brand loyalty. However, the remaining 36% represent one-time buyers, presenting an opportunity for targeted retention strategies to convert first-time purchasers into repeat customers.

#### 5. Customer Concentration and Pareto Analysis
<p align="center">
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/b9487d5b-1397-4d4b-824c-e5ab5615b877" />
</p>
Pareto analysis reveals that 1,133 of 4,339 customers (26%) contribute 80% of total revenue, indicating significant concentration. However, this concentration is distributed rather than extreme: the top 10 customers generate approximately $1.5M (14% of total revenue), with the two highest contributors being CustomerID 14646 (Netherlands) at $280K and CustomerID 18102 (UK) at $260K. This pattern suggests the business depends on a substantial group of moderately high-value customers rather than a few dominant "whale" accounts. While this distribution reduces the risk of catastrophic revenue loss from a single customer departure, it still presents meaningful concentration risk given that roughly one-quarter of the customer base drives the vast majority of revenue.

## Recommendations
1. Implement Risk Management for Bulk-Order Products:
Products such as Paper Craft, Little Birdie (23843) and Medium Ceramic Top Storage Jar (23166) achieve high volumes primarily through large orders from a few key customers. Relying on these metrics poses a severe operational risk for procurement planning. It is recommended that the organization treat these SKUs strictly as ad-hoc, on-demand fulfillment items while prioritizing core capital allocation and stock depth for products 22197, 84077, and 85099B, which exhibit highly predictable, decentralized consumption patterns.
2. Given that the 2011 data represents a single macro cycle, establishing a definitive seasonal baseline requires further longitudinal validation. It is recommended that the organization closely monitor monthly revenue variance over the next 24 to 36 months to confirm true cyclical seasonality versus an isolated anomaly. To mitigate current cash flow volatility in the interim, management should execute a targeted transactional audit of November 2011 revenue to determine if the $1.5M spike indicates repeatable Q4 consumer demand or a non-recurring bulk corporate account. Concurrently, the business should transition from rigid annual budgeting to monthly rolling forecasts, updating revenue projections using real-time sales data to maximize operational agility while a multi-year baseline is established.
3. With approximately 36% of customers being one-time buyers, there is a significant opportunity to convert them into repeat customers. Implement retention strategies such as follow-up emails, personalized recommendations, loyalty rewards, or targeted promotions for first-time buyers. Further analyze the purchasing behavior of repeat customers to identify factors driving loyalty and replicate them across new or one-time customers.
4. To mitigate revenue concentration risk, the organization should execute a balanced growth-and-retention strategy by deploying targeted client acquisition frameworks alongside dedicated Key Account Management workflows for high-value accounts. Concurrently, management should optimize resource allocation by divesting from low-yield, under $1K markets—specifically Saudi Arabia, Bahrain, and the Czech Republic. These underutilized assets should be systematically reallocated to high-potential, high-velocity regions such as the Netherlands, EIRE, Germany, and France, where demonstrated market receptivity.


















