-- View table
/* SELECT * FROM supermarket.`supermarket_sales`; */
/* SELECT COUNT(*) AS count_col FROM supermarket.`supermarket_sales`; */

-- Change column name
/* ALTER TABLE supermarket.`supermarket_sales`
RENAME COLUMN `Invoice ID` TO Invoiceid,
RENAME COLUMN `Customer type` TO Customertype,
RENAME COLUMN `Product line` TO Productline,
RENAME COLUMN `Unit price` TO Unitprice,
RENAME COLUMN `gross income` TO gross_income; */

-- Best sales Product line in each Branch
/* WITH Branch_catg AS (
	SELECT Branch, City, MAX(Productline) AS best_product, SUM(Total) AS total_sales
	FROM supermarket.`supermarket_sales`
	GROUP BY Branch, Productline
	ORDER BY total_sales DESC
	)
SELECT Branch, City, best_product, MAX(total_sales) AS best_sales
FROM Branch_catg
GROUP BY Branch
ORDER BY best_sales DESC; */

-- Average high rating in each Branch
/* WITH avg_rating AS (
	SELECT Branch, City, AVG(Rating) AS average_rating
	FROM supermarket.`supermarket_sales`
	GROUP BY Branch, Rating
	)
SELECT Branch, City, average_rating
FROM avg_rating
GROUP BY Branch
ORDER BY average_rating DESC; */

-- Ranking of branches with the highest income
/* WITH high_income AS (
	SELECT Branch, City, MAX(productline) AS best_productline, SUM(gross_income) AS total_income
	FROM supermarket.`supermarket_sales`
	GROUP BY Branch, productline
)
SELECT Branch, City, best_productline, total_income
FROM high_income
GROUP BY Branch
ORDER BY total_income DESC; */

-- Average time for highest customer
/* SELECT Branch, City, AVG(Time) AS avg_time
FROM supermarket.`supermarket_sales`
GROUP BY Branch
ORDER BY avg_time */

-- Most Gender spent on each Customer type
WITH most_gender AS (
	SELECT Gender, Customertype, SUM(Total) AS total_sales
	FROM supermarket.`supermarket_sales`
	GROUP BY Gender, Customertype
	)
SELECT Gender, Customertype, total_sales
FROM most_gender
GROUP BY Gender
