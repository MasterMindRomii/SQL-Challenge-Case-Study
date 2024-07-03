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

