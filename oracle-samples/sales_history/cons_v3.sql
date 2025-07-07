--- Creating constraints ...

--
-- PROMOTIONS
--

ALTER TABLE promotions
  ADD CONSTRAINT promo_pk
  PRIMARY KEY (promo_id);

ALTER TABLE sales
  ADD CONSTRAINT sales_promo_fk
  FOREIGN KEY (promo_id) REFERENCES promotions (promo_id);

ALTER TABLE costs
  ADD CONSTRAINT costs_promo_fk
  FOREIGN KEY (promo_id) REFERENCES promotions (promo_id);

--
-- CUSTOMERS
--

ALTER TABLE customers
  ADD CONSTRAINT customers_pk
  PRIMARY KEY (cust_id);

ALTER TABLE sales
  ADD CONSTRAINT sales_customer_fk
  FOREIGN KEY (cust_id) REFERENCES customers (cust_id);

--
-- PRODUCTS
--

ALTER TABLE products
  ADD CONSTRAINT products_pk
  PRIMARY KEY (prod_id);

ALTER TABLE sales
  ADD CONSTRAINT sales_product_fk
  FOREIGN KEY (prod_id) REFERENCES products (prod_id);

ALTER TABLE costs
  ADD CONSTRAINT costs_product_fk
  FOREIGN KEY (prod_id) REFERENCES products (prod_id);

--
-- TIMES
--

ALTER TABLE times
  ADD CONSTRAINT times_pk
  PRIMARY KEY (time_id);

ALTER TABLE sales
  ADD CONSTRAINT sales_time_fk
  FOREIGN KEY (time_id) REFERENCES times (time_id);

ALTER TABLE costs
  ADD CONSTRAINT costs_time_fk
  FOREIGN KEY (time_id) REFERENCES times (time_id);

--
-- CHANNELS
--

ALTER TABLE channels
  ADD CONSTRAINT channels_pk
  PRIMARY KEY (channel_id);

ALTER TABLE sales
  ADD CONSTRAINT sales_channel_fk
  FOREIGN KEY (channel_id) REFERENCES channels (channel_id);

ALTER TABLE costs
  ADD CONSTRAINT costs_channel_fk
  FOREIGN KEY (channel_id) REFERENCES channels (channel_id);

--
-- COUNTRIES
--

ALTER TABLE countries
  ADD CONSTRAINT countries_pk
  PRIMARY KEY (country_id);

ALTER TABLE customers
  ADD CONSTRAINT customers_country_fk
  FOREIGN KEY (country_id) REFERENCES countries (country_id);

--
-- SUPPLEMENTARY DEMOGRAPHICS
--

ALTER TABLE supplementary_demographics
  ADD CONSTRAINT supp_demo_pk
  PRIMARY KEY (cust_id);
