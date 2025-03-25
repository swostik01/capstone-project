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

## Project Structure

### 1. Staging Models (Raw Data Preparation)
These models clean and standardize the raw data before further transformation.

| File               | Description                                   |
|--------------------|-----------------------------------------------|
| `stg_customer.sql` | Cleans & prepares customer data.             |
| `stg_product.sql`  | Cleans & enriches product details.           |
| `stg_returns.sql`  | Processes product return data.               |
| `stg_sales.sql`    | Prepares sales transactions for analysis.    |
| `stg_territory.sql` | Formats & standardizes territory details.   |
| `stg_tests.yml`    | Defines dbt tests for staging models.        |
| `raw_sources.yml`  | Configures raw data source tables.           |

---

### 2. Marts Models (Aggregated Business Metrics)
These models contain aggregated data for reporting and decision-making.

| File                              | Description                                      |
|-----------------------------------|--------------------------------------------------|
| `marts_most_returned_products.sql` | Identifies most returned products per category.  |
| `marts_repeat_customers.sql`       | Tracks repeat customers & their orders.         |
| `marts_revenue_by_category.sql`    | Computes revenue & profit by category.          |
| `marts_sales.sql`                  | Aggregates sales data & customer details.       |
| `marts_sales_region.sql`           | Analyzes sales trends by region.                |

---

### 3. Monthly KPIs (Key Business Indicators)
These models help track key performance metrics at a monthly level.

| File                          | Description                      |
|-------------------------------|----------------------------------|
| `marts_kpi_monthly_orders.sql` | Tracks total orders per month.  |
| `marts_kpi_monthly_sales.sql`  | Tracks total revenue per month. |

---

### 4. Snapshots (Historical Tracking)
Snapshots help capture changes in data over time.

| File                   | Description                                |
|------------------------|--------------------------------------------|
| `customer_snapshot.sql` | Captures customer data changes over time. |

---

### 5. Macros (Reusable Code)
Macros help automate transformations and calculations.

| File                   | Description                                 |
|------------------------|---------------------------------------------|
| `y_o_y_comparison.sql` | Macro to calculate Year-over-Year growth. |

---

### 6. Tests (Data Quality Assurance)
Custom tests ensure data consistency and validity.

| File                              | Description                                            |
|-----------------------------------|--------------------------------------------------------|
| `min_return_quantity.sql`         | Ensures returned quantity is not below a threshold.   |
| `test_no_negative_revenue.sql`    | Validates that revenue values are never negative.     |
| `test_no_null_values.sql`         | Checks for missing/null values in key tables.        |
| `unique_composite_key_sales.sql`  | Ensures uniqueness of the composite key in sales table. |

---

### 7. Seeds (Static Reference Data)
Seeds contain pre-loaded CSV files with reference data.

| File                        | Description                           |
|-----------------------------|---------------------------------------|
| `product_categories.csv`     | Contains product category mappings.  |
| `product_subcategories.csv`  | Contains product subcategory mappings. |

## Setup Instructions

Follow these steps to set up and run the project:

### 1. Clone the repository:
```sh
git clone <repo-url>
```

### 2. Navigate into the project directory:
```sh
cd capstone-project
```

### 3. Install dbt dependencies:
```sh
dbt deps
```

### 4. Run dbt models:
```sh
dbt run
```

### 5. Run dbt snapshots:
```sh
dbt snapshot
```

### 6. Build dbt models (run + tests + snapshots):
```sh
dbt build
```

### 7. Test data integrity:
```sh
dbt test
```

### 8. Generate documentation:
```sh
dbt docs generate
```

---

# Contributors

- **Swostik Sahoo**
