# capstone-project
DBT Snowflake Project

## Overview:
This project leverages dbt (Data Build Tool) and Snowflake to transform raw data into structured data marts for business analytics. It includes models for sales trends, revenue analysis, repeat customers, and return tracking, along with data quality tests to ensure accuracy and consistency.

Repository Structure
| Folder               | Purpose                                           |
|----------------------|---------------------------------------------------|
| `models/staging/`    | Cleans & prepares raw data for transformation.   |
| `models/marts/`      | Core business logic for data marts.              |
| `models/monthly_kpis/` | Monthly KPI calculations.                     |
| `macros/`            | Reusable SQL functions.                          |
| `snapshots/`         | Historical data tracking (SCD Type-2).           |
| `seeds/`             | Static reference datasets.                       |
| `tests/singular/`    | Custom SQL-based tests to validate data integrity. |

