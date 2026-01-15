



CREATE TABLE amazon_superstore (
    order_id VARCHAR(50),
    order_date DATE,
    year INT,
    month VARCHAR(20),
    country VARCHAR(50),
    city VARCHAR(50),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    order_status VARCHAR(20),
    quantity INT,
    unit_price_inr NUMERIC(10,2),
    total_amount_inr NUMERIC(12,2)
);


Select * from amazon_superstore


COPY amazon_superstore
FROM 'C:/Amazon Dataset/Amazon_Superstore_Dataset.CSV'
DELIMITER ','
CSV HEADER;

-- Basic Query

-- Q1. Write a SQL query to display all records from the Amazon Superstore table.

SELECT *
FROM amazon_superstore;

-- Q2. Write a SQL query to display Order_ID, Order_Date, and Total_Amount_INR for all orders.

SELECT Order_ID, Order_Date, Total_Amount_INR
FROM amazon_superstore;

--Q3. Write a SQL query to find all orders where the order status is 'Completed'.

SELECT *
FROM amazon_superstore
WHERE Order_Status = 'Completed';

-- Q4. Write a SQL query to retrieve all orders where the quantity sold is greater than 3.

SELECT *
FROM amazon_superstore
WHERE Quantity > 3;

-- Q5. Write a SQL query to display all orders placed in India.

SELECT *
FROM amazon_superstore
WHERE Country = 'India';

-- Q6. Write a SQL query to count the total number of orders.

SELECT COUNT(*) AS total_orders
FROM amazon_superstore;

-- Q7. Write a SQL query to calculate the total revenue generated.

SELECT SUM(Total_Amount_INR) AS total_revenue
FROM amazon_superstore;

-- Q8. Write a SQL query to calculate the average unit price of products.

SELECT AVG(Unit_Price_INR) AS average_unit_price
FROM amazon_superstore;

-- Q9. Write a SQL query to find the maximum order value.

SELECT MAX(Total_Amount_INR) AS max_order_value
FROM amazon_superstore;

-- Q10. Write a SQL query to find the minimum order value.

SELECT MIN(Total_Amount_INR) AS min_order_value
FROM amazon_superstore;

-- Q11. Write a SQL query to list all unique product categories.

SELECT DISTINCT Category
FROM amazon_superstore;

-- Q12. Write a SQL query to display all orders placed in the year 2024.

SELECT *
FROM amazon_superstore
WHERE Year = 2024;

UPDATE amazon_superstore
SET year = EXTRACT(YEAR FROM order_date)
WHERE year <> EXTRACT(YEAR FROM order_date);

-- Q13. Write a SQL query to display all orders placed in the month of March.

SELECT *
FROM amazon_superstore
WHERE Month = 'Mar';

-- Q14. Write a SQL query to sort all orders by Total_Amount_INR in descending order.

SELECT *
FROM amazon_superstore
ORDER BY Total_Amount_INR DESC;

-- Q15. Write a SQL query to fetch the top 5 highest value orders.

SELECT *
FROM amazon_superstore
ORDER BY Total_Amount_INR DESC
LIMIT 5;

-- Q16. Write a SQL query to calculate total sales for each category.

SELECT Category, SUM(Total_Amount_INR) AS total_sales
FROM amazon_superstore
GROUP BY Category;

-- Q17. Write a SQL query to calculate total quantity sold per category.

SELECT Category, SUM(Quantity) AS total_quantity
FROM amazon_superstore
GROUP BY Category;

-- Q18. Write a SQL query to calculate average order value per country.

SELECT Country, AVG(Total_Amount_INR) AS avg_order_value
FROM amazon_superstore
GROUP BY Country;

-- Q19. Write a SQL query to count the number of orders for each region.

SELECT Region, COUNT(*) AS total_orders
FROM amazon_superstore
GROUP BY Region;

-- Q20. Write a SQL query to display all orders where Total_Amount_INR is between 20,000 and 50,000.

SELECT *
FROM amazon_superstore
WHERE Total_Amount_INR BETWEEN 20000 AND 50000;

-- Q21. Write a SQL query to display orders from Electronics category with quantity greater than 2.

SELECT *
FROM amazon_superstore
WHERE Category = 'Electronics'
AND Quantity > 2;

-- Q22. Write a SQL query to display all orders except Clothing category.

SELECT *
FROM amazon_superstore
WHERE Category <> 'Clothing';

-- Q23. Write a SQL query to calculate total sales for each city.

SELECT City, SUM(Total_Amount_INR) AS city_sales
FROM amazon_superstore
GROUP BY City;

-- Q24. Write a SQL query to find the city with the highest total sales.

SELECT City, SUM(Total_Amount_INR) AS total_sales
FROM amazon_superstore
GROUP BY City
ORDER BY total_sales DESC
LIMIT 1;

-- Q25. Write a SQL query to count total orders per year.

SELECT Year, COUNT(*) AS total_orders
FROM amazon_superstore
GROUP BY Year;

-- Q26. Write a SQL query to calculate revenue generated per year.

SELECT Year, SUM(Total_Amount_INR) AS yearly_revenue
FROM amazon_superstore
GROUP BY Year;

-- Q27. Write a SQL query to display all completed orders sorted by order date.

SELECT *
FROM amazon_superstore
WHERE Order_Status = 'Completed'
ORDER BY Order_Date;

-- Q28. Write a SQL query to find orders with unit price greater than 15,000.

SELECT *
FROM amazon_superstore
WHERE Unit_Price_INR > 15000;

-- Q29. Write a SQL query to display all unique countries.

SELECT DISTINCT Country
FROM amazon_superstore;

-- Q30. Write a SQL query to calculate average quantity per order.

SELECT AVG(Quantity) AS avg_quantity
FROM amazon_superstore;

-- 🔹 INTERMEDIATE SQL QUESTIONS (31–65)

-- Q31. Write a SQL query to rank all orders based on total amount.

SELECT Order_ID, Total_Amount_INR,
RANK() OVER (ORDER BY Total_Amount_INR DESC) AS order_rank
FROM amazon_superstore;

-- Q32. Write a SQL query to assign row numbers to orders ordered by Order_Date.

SELECT Order_ID,
ROW_NUMBER() OVER (ORDER BY Order_Date) AS row_num
FROM amazon_superstore;

-- Q33. Write a SQL query to calculate running total of sales ordered by date.

SELECT Order_Date,
SUM(Total_Amount_INR) OVER (ORDER BY Order_Date) AS running_total
FROM amazon_superstore;

-- Q34. Write a SQL query to calculate percentage contribution of each category to total sales.

SELECT Category,
SUM(Total_Amount_INR) * 100.0 / SUM(SUM(Total_Amount_INR)) OVER () AS sales_percentage
FROM amazon_superstore
GROUP BY Category;

-- Q35. Write a SQL query to calculate monthly sales.

SELECT Month, SUM(Total_Amount_INR) AS monthly_sales
FROM amazon_superstore
GROUP BY Month;

-- Q36. Write a SQL query to find the top 3 categories by total sales.

SELECT Category, SUM(Total_Amount_INR) AS total_sales
FROM amazon_superstore
GROUP BY Category
ORDER BY total_sales DESC
LIMIT 3;

-- Q37. Write a SQL query to find orders with total amount greater than average order value.

SELECT *
FROM amazon_superstore
WHERE Total_Amount_INR >
(SELECT AVG(Total_Amount_INR) FROM amazon_superstore);

-- Q38. Write a SQL query to calculate total revenue generated by each country.

SELECT Country, SUM(Total_Amount_INR) AS revenue
FROM amazon_superstore
GROUP BY Country;

-- Q39. Write a SQL query to calculate average order value per category.

SELECT Category, AVG(Total_Amount_INR) AS avg_order_value
FROM amazon_superstore
GROUP BY Category;

-- Q40. Write a SQL query to calculate total orders per category per country.

SELECT Country, Category, COUNT(*) AS total_orders
FROM amazon_superstore
GROUP BY Country, Category;


-- (Intermediate continues smoothly into Advanced)

🔥 ADVANCED SQL – CTE BASED QUESTIONS (66–100)
-- Q66. Write a SQL query using a CTE to calculate total sales per category.

WITH category_sales AS (
    SELECT Category, SUM(Total_Amount_INR) AS total_sales
    FROM amazon_superstore
    GROUP BY Category
)
SELECT *
FROM category_sales;

-- Q67. Write a SQL query to find the highest selling category using a CTE.

WITH category_sales AS (
    SELECT Category, SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Category
)
SELECT *
FROM category_sales
ORDER BY sales DESC
LIMIT 1;

-- Q68. Write a SQL query to find top selling category for each country using CTE and ranking.

WITH ranked_category AS (
    SELECT Country, Category,
           SUM(Total_Amount_INR) AS sales,
           RANK() OVER (PARTITION BY Country ORDER BY SUM(Total_Amount_INR) DESC) AS rnk
    FROM amazon_superstore
    GROUP BY Country, Category
)
SELECT Country, Category, sales
FROM ranked_category
WHERE rnk = 1;

-- Q69. Write a SQL query to calculate month-over-month sales growth using CTE.

WITH monthly_sales AS (
    SELECT Year, Month, SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Year, Month
)
SELECT Year, Month,
sales,
sales - LAG(sales) OVER (ORDER BY Year, Month) AS growth
FROM monthly_sales;

-- Q70. Write a SQL query to calculate cumulative revenue over years using CTE.

WITH yearly_sales AS (
    SELECT Year, SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Year
)
SELECT Year,
SUM(revenue) OVER (ORDER BY Year) AS cumulative_revenue
FROM yearly_sales;

-- Q71. Write a SQL query to perform Pareto (80/20) analysis to identify customers contributing to 80% of total revenue.

WITH category_sales AS (
    SELECT category,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY category
),
ranked_categories AS (
    SELECT category,
           revenue,
           SUM(revenue) OVER (ORDER BY revenue DESC) AS running_revenue,
           SUM(revenue) OVER () AS total_revenue
    FROM category_sales
)
SELECT category, revenue
FROM ranked_categories
WHERE running_revenue <= 0.8 * total_revenue;

-- Q72. Write a SQL query to find top 10% orders based on sales amount using CTE.

WITH order_sales AS (
    SELECT Order_ID, Total_Amount_INR
    FROM amazon_superstore
),
ranked_orders AS (
    SELECT Order_ID,
           Total_Amount_INR,
           NTILE(10) OVER (ORDER BY Total_Amount_INR DESC) AS bucket
    FROM order_sales
)
SELECT Order_ID, Total_Amount_INR
FROM ranked_orders
WHERE bucket = 1;

-- Q73. Write a SQL query to classify orders into revenue buckets (Low, Medium, High).

WITH revenue_bucket AS (
    SELECT Order_ID,
           Total_Amount_INR,
           CASE
               WHEN Total_Amount_INR < 5000 THEN 'Low'
               WHEN Total_Amount_INR BETWEEN 5000 AND 20000 THEN 'Medium'
               ELSE 'High'
           END AS revenue_category
    FROM amazon_superstore
)
SELECT revenue_category, COUNT(*) AS total_orders
FROM revenue_bucket
GROUP BY revenue_category;

-- Q74. Write a SQL query to compare region-wise total revenue and rank regions.

WITH region_sales AS (
    SELECT Region,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Region
)
SELECT Region,
       revenue,
       RANK() OVER (ORDER BY revenue DESC) AS region_rank
FROM region_sales;

-- Q75. Write a SQL query to calculate category-wise year-over-year growth using CTE.

WITH yearly_category_sales AS (
    SELECT Year, Category,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Year, Category
)
SELECT Year,
       Category,
       sales,
       sales - LAG(sales) OVER (PARTITION BY Category ORDER BY Year) AS yoy_growth
FROM yearly_category_sales;

-- Q76. Write a SQL query to find the best-performing category in each region.

WITH category_region_sales AS (
    SELECT Region, Category,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Region, Category
),
ranked_category AS (
    SELECT Region, Category, revenue,
           RANK() OVER (PARTITION BY Region ORDER BY revenue DESC) AS rnk
    FROM category_region_sales
)
SELECT Region, Category, revenue
FROM ranked_category
WHERE rnk = 1;

-- Q77. Write a SQL query to calculate running total of sales for each category.


WITH category_orders AS (
    SELECT Category,
           Order_Date,
           Total_Amount_INR
    FROM amazon_superstore
)
SELECT Category,
       Order_Date,
       Total_Amount_INR,
       SUM(Total_Amount_INR) OVER (
           PARTITION BY Category
           ORDER BY Order_Date
       ) AS running_sales
FROM category_orders;

-- Q78. Write a SQL query to find category whose average order value is higher than overall average.

WITH category_avg AS (
    SELECT category,
           AVG(Total_Amount_INR) AS avg_order_value
    FROM amazon_superstore
    GROUP BY category
),
overall_avg AS (
    SELECT AVG(Total_Amount_INR) AS overall_avg_value
    FROM amazon_superstore
)
SELECT c.category,
       c.avg_order_value
FROM category_avg c
CROSS JOIN overall_avg o
WHERE c.avg_order_value > o.overall_avg_value;

-- Q79. Write a SQL query to find repeat category (category with more than 5 orders).

WITH category_orders AS (
    SELECT category,
           COUNT(order_id) AS total_orders
    FROM amazon_superstore
    GROUP BY category
)
SELECT category, total_orders
FROM category_orders
WHERE total_orders > 5;


-- Q80. Write a SQL query to calculate sales contribution percentage of each category.

WITH category_sales AS (
    SELECT Category,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Category
),
total_sales AS (
    SELECT SUM(revenue) AS total_revenue
    FROM category_sales
)
SELECT c.Category,
       c.revenue,
       ROUND((c.revenue * 100.0) / t.total_revenue, 2) AS contribution_percentage
FROM category_sales c
JOIN total_sales t ON 1=1;

-- Q81. Write a SQL query to find highest monthly sales for each year.

WITH monthly_sales AS (
    SELECT Year, Month,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Year, Month
),
ranked_months AS (
    SELECT Year, Month, sales,
           RANK() OVER (PARTITION BY Year ORDER BY sales DESC) AS rnk
    FROM monthly_sales
)
SELECT Year, Month, sales
FROM ranked_months
WHERE rnk = 1;

-- Q82. Write a SQL query to identify low-value orders that could potentially be loss-making.

SELECT Order_ID, Total_Amount_INR
FROM amazon_superstore
WHERE Total_Amount_INR < 10000;

-- Q83. Write a SQL query to calculate the average order value per order status.

SELECT Order_Status,
       AVG(Total_Amount_INR) AS avg_order_value
FROM amazon_superstore
GROUP BY Order_Status;

-- Q84. Write a SQL query to find the highest revenue-generating category in each year.

WITH yearly_category_sales AS (
    SELECT Year,
           Category,
           SUM(Total_Amount_INR) AS total_sales
    FROM amazon_superstore
    GROUP BY Year, Category
),
ranked_sales AS (
    SELECT Year,
           Category,
           total_sales,
           RANK() OVER (
               PARTITION BY Year
               ORDER BY total_sales DESC
           ) AS rnk
    FROM yearly_category_sales
)
SELECT Year, Category, total_sales
FROM ranked_sales
WHERE rnk = 1;

-- Q85. Write a SQL query to calculate total revenue per country (as a proxy for customer lifetime value).

SELECT Country,
       SUM(Total_Amount_INR) AS lifetime_value
FROM amazon_superstore
GROUP BY Country
ORDER BY lifetime_value DESC;

-- Q86. Write a SQL query to find orders above category average sales.

WITH category_avg AS (
    SELECT Category,
           AVG(Total_Amount_INR) AS avg_sales
    FROM amazon_superstore
    GROUP BY Category
)
SELECT a.Order_ID, a.Category, a.Total_Amount_INR
FROM amazon_superstore a
JOIN category_avg c
ON a.Category = c.Category
WHERE a.Total_Amount_INR > c.avg_sales;

-- Q87. Write a SQL query to find region-wise order count.

SELECT Region,
       COUNT(Order_ID) AS total_orders
FROM amazon_superstore
GROUP BY Region;

-- Q88. Write a SQL query to find the most frequently ordered sub-category.

SELECT Sub_Category,
       COUNT(Order_ID) AS order_count
FROM amazon_superstore
GROUP BY Sub_Category
ORDER BY order_count DESC
LIMIT 1;

-- Q89. Write a SQL query to calculate the percentage of returned orders based on order status.

SELECT
    ROUND(
        (SUM(CASE WHEN Order_Status = 'Not complited' THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*),
        2
    ) AS return_percentage
FROM amazon_superstore;


-- Q90. Write a SQL query to calculate revenue contribution percentage for each category.

WITH category_sales AS (
    SELECT Category,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Category
),
total_sales AS (
    SELECT SUM(revenue) AS total_revenue
    FROM category_sales
)
SELECT c.Category,
       ROUND((c.revenue * 100.0) / t.total_revenue, 2) AS revenue_percentage
FROM category_sales c
CROSS JOIN total_sales t;


-- Q91. Write a SQL query to find the top 3 revenue-generating categories in each region.

WITH region_category_sales AS (
    SELECT Region,
           Category,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Region, Category
),
ranked_categories AS (
    SELECT Region,
           Category,
           revenue,
           RANK() OVER (
               PARTITION BY Region
               ORDER BY revenue DESC
           ) AS rnk
    FROM region_category_sales
)
SELECT Region, Category, revenue
FROM ranked_categories
WHERE rnk <= 3;

-- Q92. Write a SQL query to find slow-moving sub-categories (lowest sales).

SELECT Sub_Category,
       SUM(Total_Amount_INR) AS total_sales
FROM amazon_superstore
GROUP BY Sub_Category
ORDER BY total_sales ASC
LIMIT 10;


-- Q93. Write a SQL query to calculate median order value.

SELECT
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Total_Amount_INR) AS median_order_value
FROM amazon_superstore;

-- Q94. Write a SQL query to identify regions with no orders in the last 6 months.

SELECT Region
FROM amazon_superstore
GROUP BY Region
HAVING MAX(Order_Date) < CURRENT_DATE - INTERVAL '6 months';

-- Q95. Write a SQL query to calculate cumulative profit over time.

WITH profit_data AS (
    SELECT Order_Date, Profit
    FROM amazon_superstore
)
SELECT Order_Date,
       SUM(Profit) OVER (ORDER BY Order_Date) AS cumulative_profit
FROM profit_data;

-- Q96. Write a SQL query to find average discount given per category.

SELECT Category,
       AVG(Discount) AS avg_discount
FROM amazon_superstore
GROUP BY Category;

-- Q97. Write a SQL query to identify sales trend (increasing or decreasing) month-wise.

WITH monthly_sales AS (
    SELECT Year, Month,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Year, Month
)
SELECT Year, Month, sales,
       CASE
           WHEN sales > LAG(sales) OVER (ORDER BY Year, Month) THEN 'Increasing'
           ELSE 'Decreasing'
       END AS trend
FROM monthly_sales;

-- Q98. Write a SQL query to calculate order contribution percentage by region.

WITH region_orders AS (
    SELECT Region,
           COUNT(Order_ID) AS total_orders
    FROM amazon_superstore
    GROUP BY Region
),
overall_orders AS (
    SELECT SUM(total_orders) AS total
    FROM region_orders
)
SELECT r.Region,
       ROUND((r.total_orders * 100.0) / o.total, 2) AS order_percentage
FROM region_orders r
JOIN overall_orders o ON 1=1;

-- Q99. Write a SQL query to find customers with decreasing purchase trend.

WITH customer_yearly_sales AS (
    SELECT Customer_Name, Year,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Customer_Name, Year
)
SELECT Customer_Name, Year, sales
FROM (
    SELECT Customer_Name, Year, sales,
           sales - LAG(sales) OVER (PARTITION BY Customer_Name ORDER BY Year) AS diff
    FROM customer_yearly_sales
) t
WHERE diff < 0;

-- Q100. Write a SQL query to generate executive summary KPIs using CTE.

WITH kpi AS (
    SELECT
        COUNT(DISTINCT Order_ID) AS total_orders,
        COUNT(DISTINCT Customer_Name) AS total_customers,
        SUM(Total_Amount_INR) AS total_revenue,
        SUM(Profit) AS total_profit
    FROM amazon_superstore
)
SELECT * FROM kpi;

-- Q101. Write a SQL query to identify customers whose revenue contribution is increasing year over year (multi-CTE analysis).

WITH yearly_customer_sales AS (
    SELECT Customer_Name,
           Year,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Customer_Name, Year
),
sales_diff AS (
    SELECT Customer_Name,
           Year,
           sales,
           sales - LAG(sales) OVER (PARTITION BY Customer_Name ORDER BY Year) AS growth
    FROM yearly_customer_sales
)
SELECT Customer_Name
FROM sales_diff
GROUP BY Customer_Name
HAVING MIN(growth) > 0;

-- Q102. Write a SQL query to find products contributing to top 80% revenue within each category (Category-wise Pareto).

WITH product_sales AS (
    SELECT Category, Product_Name,
           SUM(Total_Amount_INR) AS revenue
    FROM amazon_superstore
    GROUP BY Category, Product_Name
),
ranked_products AS (
    SELECT Category, Product_Name, revenue,
           SUM(revenue) OVER (PARTITION BY Category ORDER BY revenue DESC) AS running_revenue,
           SUM(revenue) OVER (PARTITION BY Category) AS total_revenue
    FROM product_sales
)
SELECT Category, Product_Name, revenue
FROM ranked_products
WHERE running_revenue <= 0.8 * total_revenue;

-- Q103. Write a SQL query to detect abnormal monthly sales (anomaly detection using moving average).

WITH monthly_sales AS (
    SELECT Year, Month,
           SUM(Total_Amount_INR) AS sales
    FROM amazon_superstore
    GROUP BY Year, Month
),
moving_avg AS (
    SELECT Year, Month, sales,
           AVG(sales) OVER (ORDER BY Year, Month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS avg_3_months
    FROM monthly_sales
)
SELECT Year, Month, sales, avg_3_months
FROM moving_avg
WHERE sales > avg_3_months * 1.5
   OR sales < avg_3_months * 0.5;

-- Q104. Write a SQL query to segment customers into High, Medium, Low value based on RFM analysis using CTE.

WITH rfm_base AS (
    SELECT Customer_Name,
           MAX(Order_Date) AS last_order_date,
           COUNT(Order_ID) AS frequency,
           SUM(Total_Amount_INR) AS monetary
    FROM amazon_superstore
    GROUP BY Customer_Name
),
rfm_score AS (
    SELECT Customer_Name,
           NTILE(3) OVER (ORDER BY last_order_date DESC) AS recency_score,
           NTILE(3) OVER (ORDER BY frequency DESC) AS frequency_score,
           NTILE(3) OVER (ORDER BY monetary DESC) AS monetary_score
    FROM rfm_base
)
SELECT Customer_Name,
       recency_score + frequency_score + monetary_score AS rfm_total_score,
       CASE
           WHEN (recency_score + frequency_score + monetary_score) >= 7 THEN 'High Value'
           WHEN (recency_score + frequency_score + monetary_score) BETWEEN 4 AND 6 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM rfm_score;

-- Q105. Write a SQL query to build a management-level performance report combining revenue, profit, growth, and ranking (ultimate CTE query).

WITH yearly_region_metrics AS (
    SELECT Year, Region,
           SUM(Total_Amount_INR) AS revenue,
           SUM(Profit) AS profit
    FROM amazon_superstore
    GROUP BY Year, Region
),
growth_calc AS (
    SELECT Year, Region, revenue, profit,
           revenue - LAG(revenue) OVER (PARTITION BY Region ORDER BY Year) AS revenue_growth
    FROM yearly_region_metrics
),
final_rank AS (
    SELECT Year, Region, revenue, profit, revenue_growth,
           RANK() OVER (PARTITION BY Year ORDER BY revenue DESC) AS revenue_rank
    FROM growth_calc
)
SELECT *
FROM final_rank
ORDER BY Year, revenue_rank;










