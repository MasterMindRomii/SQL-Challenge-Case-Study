-- Case Study Questions
-- Each of the following case study questions can be answered using a single SQL statement:

-- What is the total amount each customer spent at the restaurant?
SELECT s.customer_id, SUM(price) AS "Spent_Money" FROM menu m
JOIN sales s ON m.product_id = s.product_id
GROUP BY s.customer_id;

-- How many days has each customer visited the restaurant?
SELECT s.customer_id, COUNT(order_date) AS "Visited" FROM menu m
JOIN sales s ON m.product_id = s.product_id
GROUP BY s.customer_id;

-- What was the first item from the menu purchased by each customer?
SELECT s.customer_id, m.product_name FROM menu m
JOIN sales s ON m.product_id = s.product_id
WHERE (customer_id, order_date) IN (
SELECT customer_id, MIN(order_date) FROM sales
GROUP BY customer_id);


-- What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT product_name, Order_Times FROM (SELECT product_name, COUNT(order_date) AS "Order_Times" FROM menu m
JOIN sales s ON m.product_id = s.product_id
GROUP BY product_name) AS temp
ORDER BY Order_Times DESC LIMIT 1;

-- Which item was the most popular for each customer?
with cte as (SELECT customer_id,product_name, COUNT(product_name) AS "Times" FROM menu m
JOIN sales s ON m.product_id = s.product_id
GROUP BY customer_id,product_name),

cte_result as (SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY Times DESC) AS "Ranking" FROM cte )

SELECT customer_id,product_name FROM cte_result 
WHERE Ranking=1;

-- Which item was purchased first by the customer after they became a member?
SELECT s.customer_id, m.product_name AS first_item_purchased, s.order_date
FROM sales s JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date>= mem.join_date
ORDER BY s.customer_id, s.order_date
LIMIT 1;

-- Which item was purchased just before the customer became a member?
SELECT s.customer_id, m.product_name AS first_item_purchased, s.order_date
FROM sales s JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date<= mem.join_date
ORDER BY s.customer_id DESC , s.order_date DESC 
LIMIT 1;

-- What is the total items and amount spent for each member before they became a member?
SELECT mem.customer_id, SUM(m.price) AS "Amount Spent", COUNT(s.product_id) AS "Total_Items"
FROM sales s JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date< mem.join_date
GROUP BY s.customer_id;

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
SELECT s.customer_id, 
SUM(CASE WHEN m.product_name = 'sushi' THEN m.price * 2 * 10
ELSE m.price * 10 END) AS total_points
FROM  sales s JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;

-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
-- Calculate the points for customers A and B, considering the first-week promotion and regular points for January.
SELECT s.customer_id,
SUM(CASE WHEN s.order_date BETWEEN mem.join_date AND DATE_ADD(mem.join_date, INTERVAL 6 DAY) THEN m.price * 2 * 10 -- Double points for all items in the first week after joining
-- Double points for sushi outside of the first week
WHEN m.product_name = 'sushi' THEN m.price * 2 * 10
-- Regular points for other items outside of the first week
ELSE m.price * 10 END) AS total_points
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.customer_id IN ('A', 'B') AND s.order_date <= '2021-01-31'
GROUP BY s.customer_id;
