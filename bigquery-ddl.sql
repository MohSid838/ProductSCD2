-- 1) Create the dataset if it doesn’t exist
CREATE SCHEMA IF NOT EXISTS `crafty-isotope-481805-t2.product_dwh`
OPTIONS(
  location="US"
);

-- 2) Staging table (overwrite every run; same schema as your incoming file + SCD-2 cols)
CREATE TABLE IF NOT EXISTS `crafty-isotope-481805-t2.product_dwh.dim_products_staging` (
  product_id             STRING,
  name                   STRING,
  category               STRING,
  price                  FLOAT64,
  supplier               STRING,
  status               STRING,
  effective_start_date   DATE,
  effective_end_date     DATE,
  is_current             BOOL
);

truncate table `crafty-isotope-481805-t2.product_dwh.dim_products`;

-- 3) Dimension table with true SCD-2, partitioned & clustered
CREATE TABLE IF NOT EXISTS `crafty-isotope-481805-t2.product_dwh.dim_products` (
  product_id             STRING,
  name                   STRING,
  category               STRING,
  price                  FLOAT64,
  supplier               STRING,
  status               STRING,
  effective_start_date   DATE,
  effective_end_date     DATE,
  is_current             BOOL
);