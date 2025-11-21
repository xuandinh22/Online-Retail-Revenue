# Online Retail Revenue
## Background and Overview
This project is completed as part of a Tata Group job simulation hosted on the Forage website. The objective of the simulation is to approach data analysis from a business-leader perspective, focusing not only on technical execution but also on strategic thinking, clear communication, and actionable insights.

#### Throughout the project, I practiced:

•	Understanding business context before performing any analysis

•	Identifying the most effective visualizations to communicate insights clearly

•	Designing visuals that directly answer leadership questions from the CEO and CMO

#### Key Business Questions:

1.	What is the monthly trend of revenue? Which months show the largest increases or decreases? (for the year 2011 only)
2.	Which regions generate the highest and lowest revenue? (Exclude United Kingdom)
3.	Who are the top customers and how much do they contribute to total revenue? Is revenue concentrated among a few customers, or is the customer base diversified?
4.	What percentage of customers are repeating their orders? (Exclude United Kingdom)

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

•	Interactive Tableau Dashboard: <a href="https://public.tableau.com/app/profile/xuan.dinh8619/viz/Dashboard_17631801712060/DashboardOverview">view here</a>

•	SQL Scripts for Data Preparation: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Data%20Cleaning.sql">view here</a>

•	SQL Queries for Business Questions: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Data%20Analyzing.sql">view here</a>

• The initial dashboard mockup: <a href="https://github.com/xuandinh22/Online-Retail-Revenue/blob/main/Mockup.pdf">view here</a>
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
Overall, the company generated $10.7M in revenue during the analysis period, with significant concentration across customers, regions, and products. A small number of high-value customers and countries drive the majority of revenue, while top-selling products are primarily fueled by bulk orders from key accounts rather than broad-based demand. Customer engagement is strong, with 64% placing repeat orders. Monthly revenue fluctuated throughout the year, suggesting the presence of seasonal patterns. Below is a snapshot from the Tableau dashboard; the full interactive dashboard can be downloaded
<a href="https://public.tableau.com/app/profile/xuan.dinh8619/viz/Dashboard_17631801712060/DashboardOverview">view here</a>.

<p align="center">
<<img width="1100" height="650" alt="image" src="https://github.com/user-attachments/assets/4e947975-afed-4eb7-af42-101009bb7d62" />
</p>

#### 1. Product-Level Quantity Sold
The two best-selling products are Paper Craft, Little Birdie (Product 23843) with 80,995 units sold generating $168K, and Medium Ceramic Top Storage Jar (Product 23166) with 78,033 units sold generating $78K. However, a closer examination reveals that these high volumes are driven by a small number of exceptionally large orders rather than broad-based demand.
Notably, a single high-quantity order of Product 23843 was placed in December by Customer 14646 (UK), while a remarkably large order of Product 23166 was placed in January by Customer 12346 (UK). This pattern indicates that the products' top-selling status is heavily influenced by bulk purchasing from a few key customers rather than consistent demand across the customer base.
Conversely, other top-5 products (22197, 84077, and 85099B) show distributed sales across numerous customers rather than bulk order concentration, indicating broader market appeal and more stable demand patterns.

#### 2. Monthly Revenue Trends and Seasonality
Revenue fluctuates significantly throughout the year, revealing clear seasonal patterns. February represents the lowest-revenue month, followed by weak performance in April and December. Most notably, revenue drops sharply from November ($1,509K) to December ($639K), a decline of approximately $870K (58%). This substantial decrease likely reflects post-holiday consumer behavior and year-end purchasing cycle timing, suggesting that November captures peak holiday spending while December experiences the typical post-seasonal slowdown.

#### 3. Customer Retention and Repeat Purchases
Customer behavior demonstrates strong engagement, with approximately 64% making repeat purchases during the analysis period. Nearly two-thirds of customers returned for at least one additional transaction, contributing to revenue stability and indicating positive brand loyalty. However, the remaining 36% represent one-time buyers, presenting an opportunity for targeted retention strategies to convert first-time purchasers into repeat customers.

#### 4.Customer Concentration and Pareto Analysis
Pareto analysis reveals significant revenue concentration: just 1,133 of 4,339 customers (26%) contribute 80% of total revenue. Within this top segment, two customers stand out: CustomerID 14646 (UK) and CustomerID 18102 (Netherlands), each generating over $200K individually. This pattern indicates substantial business dependency on a small group of high-value customers, presenting both revenue stability from loyal clients and concentration risk should key accounts churn.

#### 5. Regional Revenue Concentration
In international markets, the Netherlands and EIRE are key revenue-driving markets despite having only 9 and 3 customers. This revenue is largely driven by a few exceptionally high-value customers. In the top 10 customers by revenue, one Netherlands customer contributes $280K out of the country's $285K, and two EIRE customers contribute a combined $261K out of $283K. These three customers are among the company's largest contributors outside of the UK, highlighting that revenue from these regions depends heavily on a very small number of high-value clients.This creates significant concentration risk: losing a single key customer could eliminate most revenue from that country. At the lower end, Saudi Arabia, Bahrain, and the Czech Republic each generated under $1K, representing minimal market presence. The vast majority (3,921 of 4,339 customers) resides in the United Kingdom, indicating heavy dependence on the domestic market. 

## Recommendations
1. For products like Paper Craft, Little Birdie (23843) and Medium Ceramic Top Storage Jar (23166), which achieve high quantities mainly through a few large orders, monitor bulk customer activity closely to mitigate revenue risk if these key customers reduce purchases.
2. Seasonal fluctuations, particularly the steep drop from November to December, suggest opportunities to plan inventory. Forecast revenue based on historical seasonal trends to optimize cash flow, staffing, and inventory management throughout the year.
3. With approximately 36% of customers being one-time buyers, there is a significant opportunity to convert them into repeat customers. Implement retention strategies such as follow-up emails, personalized recommendations, loyalty rewards, or targeted promotions for first-time buyers. Further analyze the purchasing behavior of repeat customers to identify factors driving loyalty and replicate them across new or one-time customers.
4. To mitigate revenue concentration, the company should pursue a dual strategy of expansion and protection. 


















