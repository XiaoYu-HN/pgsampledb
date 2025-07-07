-- Creating additional indexes ...
CREATE INDEX sales_prod_bix ON sales (prod_id);

CREATE INDEX sales_cust_bix ON sales (cust_id);

CREATE INDEX sales_time_bix ON sales (time_id);

CREATE INDEX sales_channel_bix ON sales (channel_id);

CREATE INDEX sales_promo_bix ON sales (promo_id);

CREATE INDEX sup_text_idx ON supplementary_demographics (comments) INDEXTYPE IS ctxsys.context PARAMETERS ('nopopulate');

CREATE INDEX sup_text_idx ON supplementary_demographics USING GIN (to_tsvector('english', comments));

-- some indexes on fact table COSTS
CREATE INDEX costs_prod_bix ON COSTS (prod_id);

CREATE INDEX costs_time_bix ON COSTS (time_id);

-- REM some indexes on dimension tables
CREATE INDEX products_prod_status_bix ON products (prod_status);

CREATE INDEX products_prod_subcat_ix ON products (prod_subcategory);

CREATE INDEX products_prod_cat_ix ON products (prod_category);

CREATE INDEX customers_gender_bix ON customers (cust_gender);

CREATE INDEX customers_marital_bix ON customers (cust_marital_status);

CREATE INDEX customers_yob_bix ON customers (cust_year_of_birth);

