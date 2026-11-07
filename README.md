# 🎵 Music Store Data Analysis Using MySQL

## 📌 Project Overview

This project focuses on analyzing a Music Store database using **MySQL Workbench** to extract meaningful business insights and answer real-world business questions.

The main objective is to explore customer purchasing behavior, identify top-performing artists and music genres, analyze revenue patterns, and understand customer spending across different countries.

By writing SQL queries and applying different SQL concepts, this project demonstrates how data can be transformed into actionable business insights to support better decision-making.

## 🎯 Business Objectives

- Identify the most valuable customers based on their total spending.
- Analyze revenue distribution across different cities and countries.
- Identify the most popular music genres in different countries.
- Discover top-performing artists based on the number of tracks.
- Understand customer purchasing behavior and spending patterns.
- Identify opportunities for music promotions and marketing campaigns.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Language:** SQL

## 🗂️ Database Overview

The project uses a relational Music Store database containing information about:

- Customers
- Employees
- Invoices
- Invoice Lines
- Tracks
- Albums
- Artists
- Genres

These tables are connected through primary and foreign keys, allowing data to be analyzed across multiple tables using SQL joins.

## 📊 Business Questions & Analysis

The following business questions were explored to understand the store's performance and customer behavior.

| No. | Business Question | Business Purpose |
|---|---|---|
| 1 | Who is the senior-most employee based on job title? | Understand the organizational hierarchy. |
| 2 | Which country has the highest number of invoices? | Identify the most active market. |
| 3 | What are the top 3 highest invoice values? | Identify high-value transactions. |
| 4 | Which city generates the highest revenue? | Identify the best city for promotional music events. |
| 5 | Who is the best customer based on total spending? | Identify high-value customers. |
| 6 | Who are the customers listening to Rock music? | Identify potential audiences for Rock music promotions. |
| 7 | Which are the top 10 Rock music artists based on track count? | Identify popular Rock artists in the dataset. |
| 8 | Which tracks have a duration longer than the average song length? | Analyze music track duration. |
| 9 | How much does each customer spend on the best-selling artist? | Understand customer spending by artist. |
| 10 | What is the most popular music genre in each country? | Understand country-wise music preferences. |
| 11 | Who is the highest-spending customer in each country? | Identify valuable customers in each market. |

## 💡 SQL Concepts Applied

During this project, I applied the following SQL concepts:

**1. Basic SQL Queries**
- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT

**2. Aggregate Functions**
- COUNT()
- SUM()
- AVG()
- ROUND()

**3. Joins**
- INNER JOIN
- Joining multiple relational tables to retrieve meaningful information.

**4. Subqueries**
- Used subqueries to identify tracks longer than the average song duration.
- Used nested queries to filter Rock music listeners.

**5. Common Table Expressions (CTEs)**
- Used WITH clauses to organize complex queries into readable steps.
- Applied CTEs to analyze customer spending and popular artists.

**6. Window Functions**
- ROW_NUMBER()
- PARTITION BY
- ORDER BY within window functions.

**7. String Functions**
- CONCAT()

**8. Grouping and Filtering**
- GROUP BY
- HAVING
- Aggregate-based analysis.

## 📈 Key Findings

The SQL analysis helped explore the following business insights:

1. **Customer Analysis:** Identified the highest-spending customer based on total invoice value.
2. **Revenue Analysis:** Identified the city generating the highest total invoice revenue.
3. **Market Analysis:** Determined which country has the highest number of invoices.
4. **Music Preference Analysis:** Identified the most popular music genres across different countries.
5. **Artist Performance:** Identified the top 10 Rock artists based on the number of tracks.
6. **Customer Segmentation:** Identified Rock music listeners and customers spending the most on the best-selling artist.
7. **Transaction Analysis:** Retrieved the top three highest invoice values.

*Note: Specific numerical findings can be added after reviewing the actual query outputs.*

## 📁 Project Structure

```text
Music-Store-Data-Analysis-SQL/
│
├── Music_Store_Query.sql
│
└── README.md
```

## 🚀 How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Connect to your MySQL database.
4. Import or open the Music Store database.
5. Open the `Music_Store_Query.sql` file.
6. Execute the SQL queries in MySQL Workbench.
7. Review the output to understand the business insights.

## 🎓 Learning Outcomes

Through this project, I improved my ability to:

- Work with relational databases.
- Write SQL queries to solve business problems.
- Retrieve and analyze data from multiple tables.
- Apply advanced SQL concepts to real-world scenarios.
- Translate business questions into SQL queries.
- Extract meaningful insights to support business decisions.

## 👨‍💻 Author

**Vibekananda Nayak**

Aspiring Data Analyst | SQL | Python | Pandas | Excel | Power BI

---

⭐ If you find this project useful, feel free to explore the SQL queries and share your feedback!
