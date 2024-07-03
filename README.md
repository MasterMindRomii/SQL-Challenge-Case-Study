# Danny's Diner Case Study

## Introduction

Danny seriously loves Japanese food, so in the beginning of 2021, he decided to embark upon a risky venture and opened a cute little restaurant that sells his three favorite foods: sushi, curry, and ramen.

Danny’s Diner needs your assistance to help the restaurant stay afloat. The restaurant has captured some very basic data from its few months of operation but has no idea how to use the data to help them run the business.

## Problem Statement

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent, and also which menu items are their favorite. Having this deeper connection with his customers will help him deliver a better and more personalized experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program. Additionally, he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

## Datasets

### Table 1: sales

The `sales` table captures all `customer_id` level purchases with corresponding `order_date` and `product_id` information for when and what menu items were ordered.

| customer_id | order_date  | product_id |
|-------------|-------------|------------|
| A           | 2021-01-01  | 1          |
| A           | 2021-01-01  | 2          |
| A           | 2021-01-07  | 2          |
| ...         | ...         | ...        |

### Table 2: menu

The `menu` table maps the `product_id` to the actual `product_name` and `price` of each menu item.

| product_id | product_name | price |
|------------|--------------|-------|
| 1          | sushi        | 10    |
| 2          | curry        | 15    |
| 3          | ramen        | 12    |

### Table 3: members

The `members` table captures the `join_date` when a `customer_id` joined the beta version of the Danny’s Diner loyalty program.

| customer_id | join_date   |
|-------------|-------------|
| A           | 2021-01-07  |
| B           | 2021-01-09  |
| ...         | ...         |

## Interactive SQL Session

You can use the provided DB Fiddle link to easily access these example datasets and write SQL queries to analyze the data.

[Click here for DB Fiddle](#)  <!-- Replace with your DB Fiddle link -->

## Case Study Questions

Each of the following case study questions can be answered using a single SQL statement:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

Feel free to choose any SQL dialect you’d like to use. The provided DB Fiddle is using PostgreSQL 13 as default.

Serious SQL students have access to a dedicated SQL script in the 8 Week SQL Challenge section of the course which they can use to generate relevant temporary tables like we’ve done throughout the entire course!

# Danny's Diner and Pizza Runner Case Study

## Introduction

Did you know that over 115 million kilograms of pizza is consumed daily worldwide??? (Well according to Wikipedia anyway…)

Danny was scrolling through his Instagram feed when something really caught his eye - “80s Retro Styling and Pizza Is The Future!”

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

## Available Data

Because Danny had a few years of experience as a data scientist - he was very aware that data collection was going to be critical for his business’ growth.

He has prepared for us an entity relationship diagram of his database design but requires further assistance to clean his data and apply some basic calculations so he can better direct his runners and optimize Pizza Runner’s operations.

### Entity Relationship Diagram

![Entity Relationship Diagram](link_to_diagram_image)  <!-- Replace with link to your entity relationship diagram image -->

### Datasets

All datasets exist within the `pizza_runner` database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.

#### Table 1: runners

The `runners` table shows the `registration_date` for each new runner.

| runner_id | registration_date |
|-----------|-------------------|
| 1         | 2021-01-01        |
| 2         | 2021-01-03        |
| 3         | 2021-01-08        |
| ...       | ...               |

#### Table 2: customer_orders

Customer pizza orders are captured in the `customer_orders` table with one row for each individual pizza that is part of the order. The `pizza_id` relates to the type of pizza which was ordered while `exclusions` are the ingredient_id values which should be removed from the pizza and `extras` are the ingredient_id values which need to be added to the pizza.

| order_id | customer_id | pizza_id | exclusions | extras    | order_time          |
|----------|-------------|----------|------------|-----------|---------------------|
| 1        | 101         | 1        |            |           | 2021-01-01 18:05:02 |
| 2        | 101         | 1        |            |           | 2021-01-01 19:00:52 |
| 3        | 102         | 1        |            | NaN       | 2021-01-02 23:51:23 |
| ...      | ...         | ...      | ...        | ...       | ...                 |

#### Table 3: runner_orders

After each order is received through the system, they are assigned to a runner in the `runner_orders` table. The `pickup_time` is the timestamp at which the runner arrives at the Pizza Runner headquarters to pick up the freshly cooked pizzas. The `distance` and `duration` fields are related to how far and long the runner had to travel to deliver the order to the respective customer.

| order_id | runner_id | pickup_time         | distance | duration | cancellation         |
|----------|-----------|---------------------|----------|----------|----------------------|
| 1        | 1         | 2021-01-01 18:15:34 | 20km     | 32 mins  |                      |
| 2        | 1         | 2021-01-01 19:10:54 | 20km     | 27 mins  |                      |
| 3        | 1         | 2021-01-03 00:12:37 | 13.4km   | 20 mins  | NaN                  |
| ...      | ...       | ...                 | ...      | ...      | ...                  |

#### Table 4: pizza_names

At the moment, Pizza Runner only has 2 pizzas available: the Meat Lovers or Vegetarian!

| pizza_id | pizza_name    |
|----------|---------------|
| 1        | Meat Lovers   |
| 2        | Vegetarian    |

#### Table 5: pizza_recipes

Each `pizza_id` has a standard set of toppings which are used as part of the pizza recipe.

| pizza_id | toppings                |
|----------|-------------------------|
| 1        | 1, 2, 3, 4, 5, 6, 8, 10  |
| 2        | 4, 6, 7, 9, 11, 12       |

#### Table 6: pizza_toppings

This table contains all of the `topping_name` values with their corresponding `topping_id` value.

| topping_id | topping_name |
|------------|--------------|
| 1          | Bacon        |
| 2          | BBQ Sauce    |
| 3          | Beef         |
| ...        | ...          |

## Interactive SQL Instance

You can use the provided DB Fiddle link to easily access these example datasets and write SQL queries to analyze the data.

[Click here for DB Fiddle](#)  <!-- Replace with your DB Fiddle link -->

## Case Study Questions

This case study has a wide range of questions - please feel free to pick and choose which ones you’d like to try!

### A. Pizza Metrics

- How many pizzas were ordered?
- How many unique customer orders were made?
- How many successful orders were delivered by each runner?
- How many of each type of pizza was delivered?
- How many Vegetarian and Meatlovers were ordered by each customer?
- What was the maximum number of pizzas delivered in a single order?
- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
- How many pizzas were delivered that had both exclusions and extras?
- What was the total volume of pizzas ordered for each hour of the day?
- What was the volume of orders for each day of the week?

### B. Runner and Customer Experience

- How many runners signed up for each 1-week period? (i.e. week starts 2021-01-01)
- What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pick up the order?
- Is there any relationship between the number of pizzas and how long the order takes to prepare?
- What was the average distance traveled for each customer?
- What was the difference between the longest and shortest delivery times for all orders?
- What was the average speed for each runner for each delivery and do you notice any trend for these values?
- What is the successful delivery percentage for each runner?

### C. Ingredient Optimization

- What are the standard ingredients for each pizza?
- What was the most commonly added extra?
- What was the most common exclusion?
- Generate an order item for each record in the `customers_orders` table in the format of one of the following:
  - Meat Lovers
  - Meat Lovers - Exclude Beef
  - Meat Lovers - Extra Bacon
  - Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
- Generate an alphabetically ordered comma-separated ingredient list for each pizza order from the `customer_orders` table and add a 2x in front of any relevant ingredients. For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
- What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

### D. Pricing and Ratings

- If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
- What if there was an additional $1 charge for any pizza extras? (e.g., Add cheese is $1 extra)
- The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
- Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
  - customer_id
  - order_id
  - runner_id
  - rating
  - order_time
  - pickup_time
  - Time between order and pickup
  - Delivery duration
  - Average speed
  - Total number of pizzas
- If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometer traveled - how much money does Pizza Runner have left over after these deliveries?

Feel free to choose any SQL dialect you’d like to use. The provided DB Fiddle is using PostgreSQL 13 as default.

Serious SQL students can copy and paste the Schema SQL code below directly into their SQLPad GUI to create permanent tables or they can add a TEMP within the table creation steps like we’ve done throughout the entire course!
