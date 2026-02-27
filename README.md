# MySQL - Database Course Notes

A structured collection of SQL scripts and notes covering **23 topics**, from database fundamentals to advanced querying techniques. Based on a hands-on YouTube course using the Classic Models sample database.

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/Language-SQL-orange?style=flat-square)]()
[![Topics](https://img.shields.io/badge/Topics-23-blue?style=flat-square)]()

---

## Table of Contents

- [About](#about)
- [Topics Covered](#topics-covered)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Code Examples](#code-examples)
- [Resources](#resources)
- [Additional Resources](#additional-resources)
- [Acknowledgments](#acknowledgments)

---

## About

This repository contains all SQL scripts, notes, and examples written during a structured MySQL course. Topics range from table design and constraints to subqueries, aggregate functions, and built-in string/date/math functions.

The `klasikmodeller` (Classic Models) sample database is used throughout — a fictional wholesale company selling scale model cars, ships, and motorcycles.

---

## Topics Covered

| # | Topic | Concepts |
|---|-------|----------|
| 01 | Lesson | `CREATE TABLE`, `AUTO_INCREMENT`, `ENGINE=INNODB`, data types |
| 02 | Primary Key | `PRIMARY KEY`, single & composite keys |
| 03 | Primary Key — Alter | `ALTER TABLE ADD PRIMARY KEY` |
| 04 | Foreign Key | `FOREIGN KEY`, `ON UPDATE`, `ON DELETE` — CASCADE / SET NULL / RESTRICT |
| 05 | UNIQUE | `UNIQUE` constraint, composite unique, `DROP INDEX` |
| 06 | CHECK | `CHECK` constraint, table-level check |
| 07 | NOT NULL | `NOT NULL`, `IS NULL`, `MODIFY` column |
| 08 | Alter Table | `ADD`, `DROP`, `MODIFY`, `CHANGE COLUMN`, `RENAME TO` |
| 09 | SELECT — ORDER BY | `ASC`, `DESC`, multi-column sort, `FIELD()` custom order |
| 10 | DISTINCT — LIMIT — AS | `DISTINCT`, `LIMIT offset`, `CONCAT`, column aliases |
| 11 | INSERT | `INSERT INTO VALUES`, `DEFAULT`, `CURRENT_DATE()`, bulk insert |
| 12 | INSERT INTO SELECT | Copy rows from one table into another |
| 13 | ON DUPLICATE KEY / INSERT IGNORE | Duplicate key handling strategies |
| 14 | UPDATE | `SET`, `WHERE`, `REPLACE()` in updates, subquery-based update |
| 15 | DELETE | `DELETE WHERE`, `LIMIT`, `ORDER BY` with delete |
| 16 | DELETE — ON DELETE CASCADE | Cascading deletes through foreign key relationships |
| 17 | GROUP BY | Grouping with `INNER JOIN`, `YEAR()`, computed columns |
| 18 | GROUP BY HAVING | `HAVING` vs `WHERE`, filtering aggregated results |
| 19 | Subqueries | `IN`, `NOT IN`, `EXISTS`, correlated subqueries, subquery in `FROM` |
| 20 | AVG COUNT SUM MAX MIN | Aggregate functions, `GROUP_CONCAT()` |
| 21 | String Functions | `CONCAT`, `LENGTH`, `INSTR`, `SUBSTR`, `UPPER`, `LOWER`, `REPLACE`, `TRIM` |
| 22 | Mathematical Functions | `ABS`, `CEIL`, `FLOOR`, `ROUND`, `TRUNCATE`, `MOD` |
| 23 | Date Functions | `CURDATE`, `DATEDIFF`, `DAY`, `MONTH`, `YEAR`, `DAYNAME`, `DAYOFWEEK` |

---

## Database Schema

The `klasikmodeller` database has the following structure:

```
<img width="1396" height="1276" alt="Image" src="https://github.com/user-attachments/assets/6ed2a2be-9924-4f10-920d-da4e184c855e" />
```

| Table | Description |
|-------|-------------|
| `musteriler` | Customer records |
| `siparisler` | Order headers |
| `siparisdetay` | Order line items |
| `urunler` | Product catalog |
| `urunhatlari` | Product line categories |
| `personel` | Employee records |
| `ofisler` | Office locations |
| `odemeler` | Payment records |

---

## Getting Started

### Prerequisites

- [MySQL 8.0+](https://dev.mysql.com/downloads/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/) (recommended) or any SQL client

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/your-username/mysql-course.git
cd mysql-course

# 2. Connect to MySQL
mysql -u root -p

# 3. (Optional) Load the sample database
SOURCE klasikmodeller.sql;

# 4. Run any lesson script
SOURCE 09-SELECT-ORDER-BY/select_orderby.sql;
```

### Folder Structure

```
mysql-course/
├── 01-Lesson/
├── 02-PrimaryKey/
├── 03-PrimaryKeyAlter/
├── 04-ForeignKey/
├── 05-Unique/
├── 06-Check/
├── 07-NotNull/
├── 08-AlterTable/
├── 09-Select-OrderBy/
├── 10-Distinct-Limit-As/
├── 11-Insert/
├── 12-Insert-Into-Select/
├── 13-Insert-Duplicate-Ignore/
├── 14-Update/
├── 15-Delete/
├── 16-Delete-Cascade/
├── 17-GroupBy/
├── 18-GroupBy-Having/
├── 19-Subqueries/
├── 20-Aggregate-Functions/
├── 21-String-Functions/
├── 22-Math-Functions/
├── 23-Date-Functions/
└── README.md
```

---

## Code Examples

### Foreign Key with CASCADE

```sql
CREATE TABLE orders (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    product_id  INT,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
            REFERENCES products(product_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
);
```

### GROUP BY + HAVING

```sql
SELECT
    order_id,
    SUM(quantity * unit_price) AS total_amount
FROM order_items
GROUP BY order_id
HAVING total_amount > 5000
ORDER BY total_amount DESC;
```

### Correlated Subquery with EXISTS

```sql
-- Find customers who placed at least one order worth over $60,000
SELECT customer_id, customer_name
FROM customers
WHERE EXISTS (
    SELECT order_id
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE orders.customer_id = customers.customer_id
    GROUP BY order_id
    HAVING SUM(unit_price * quantity) > 60000
);
```

### ON DUPLICATE KEY UPDATE

```sql
INSERT INTO devices (device_id, name)
    VALUES (4, 'Printer')
    ON DUPLICATE KEY UPDATE name = 'Office Printer';
```

### String Operations

```sql
-- Extract suffix from a product code like 'S10_1678' → '1678'
SELECT
    product_code,
    RIGHT(product_code, LENGTH(product_code) - INSTR(product_code, '_')) AS code_suffix
FROM products;
```

### Date Calculations

```sql
-- Days between requested and actual shipping date
SELECT
    order_id,
    DATEDIFF(required_date, shipped_date)  AS days_difference,
    DAYNAME(order_date)                    AS order_day
FROM orders
WHERE status = 'Shipped'
ORDER BY days_difference DESC;
```

---

## Resources

- **Course:** [MySQL Tutorial Series on YouTube](https://www.youtube.com/watch?v=1DWVbvrIoRI&list=PLDwrYAlc_zve0iCM4C3Cm9_TAuTSZw7zB)
- **Official Docs:** [MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
- **Tool:** [MySQL Workbench](https://www.mysql.com/products/workbench/)

---

## Additional Resources

- [MySQL Tutorial](https://www.mysqltutorial.org/) - Interactive SQL tutorials
- [W3Schools SQL](https://www.w3schools.com/sql/) - SQL reference and examples
- [LeetCode Database](https://leetcode.com/problemset/database/) - Practice SQL problems
- [MySQL Workbench](https://www.mysql.com/products/workbench/) - Visual database design tool

## Contributing

Pull requests welcome! Feel free to:
- Fix errors or typos
- Add examples
- Improve explanations

## Acknowledgments

- MySQL community for comprehensive documentation
- Contributors and learners who provide feedback

---

**Author:** 
**Amrah Ibadzada**

- GitHub: [@AmrahIbadzada](https://github.com/AmrahIbadzada)
- LinkedIn: https://az.linkedin.com/in/amrah-ibadzada/
- Email: emrahibadzade5@gmail.com

## Keywords

`mysql` `sql` `database` `tutorial` `learning` `crud` `joins` `subqueries` `aggregate-functions` `string-functions` `date-functions` `foreign-keys` `constraints` `azerbaijani` `turkish`
