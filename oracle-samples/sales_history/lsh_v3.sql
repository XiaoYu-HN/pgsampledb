--
-- TIMES
--

\copy times from program 'sed "s/-00-00-00//g" time_v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);

--
-- COUNTRIES
--

\copy countries from program 'sed "s/|$//g" coun_v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);

--
-- CUSTOMERS
--
\copy customers from program 'sed "s/-00-00-00//g;s/|$//g" cust1v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);

--
-- PRODUCTS
--
\copy products from program 'sed "s/-00-00-00//g;s/|$//g" prod1v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|',
	QUOTE '^'
);

--
-- PROMOTIONS
--
\copy promotions from program 'sed "s/-00-00-00//g" prom1v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);


--
-- CHANNELS
--
\copy channels from program 'sed "s/|$//g" chan_v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);

--
-- SALES
--
/*
\copy sales from program 'sed "s/-*[0-9]\+\(\.[0-9]\+\)\?|$//g"|sed "s/|-*[0-9]\+\(\.[0-9]\+\)\?|$//g" sale1v3.dat'
 WITH (
    FORMAT csv,
    DELIMITER '|'
);
*/

-- pre-process the dat file, because above sed in-the-fly process is TOO slow
-- sed "s/-*[0-9]\+\(\.[0-9]\+\)\?|$//g" sale1v3.dat > 1
-- sed "s/|-*[0-9]\+\(\.[0-9]\+\)\?|$//g" 1 > 2
-- mv 2 sale1v3_pg.dat
-- rm 1
\copy sales from sale1v3_pg.dat
 WITH (
    FORMAT csv,
    DELIMITER '|'
);


--
-- COSTS
--

\! sed "s/|$//g" sale1v3.dat > sale1v3_fdw.dat
CREATE EXTENSION file_fdw;
CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;
CREATE FOREIGN TABLE sales_transactions_ext
( PROD_ID               NUMERIC,
  CUST_ID               NUMERIC,
  TIME_ID               DATE,
  CHANNEL_ID    NUMERIC,
  PROMO_ID              NUMERIC,
  QUANTITY_SOLD   NUMERIC,
  AMOUNT_SOLD   NUMERIC(10,2),
  UNIT_COST     NUMERIC(10,2),
  UNIT_PRICE    NUMERIC(10,2)
) SERVER file_server
OPTIONS
(
format 'csv', filename '/var/lib/pgsql/db-sample-schemas/sales_history/sale1v3_fdw.dat', delimiter '|'
);

INSERT INTO costs
( prod_id,
  time_id,
  channel_id,
  promo_id,
  unit_cost,
  unit_price )
SELECT
  prod_id,
  time_id,
  channel_id,
  promo_id,
  AVG(unit_cost),
  AVG(amount_sold/quantity_sold)
FROM
  sales_transactions_ext
GROUP BY
  prod_id,
  time_id,
  channel_id,
  promo_id;


DROP FOREIGN TABLE sales_transactions_ext;
\! rm sale1v3_fdw.dat

--
-- ODM additional SALES rows
--

\! sed "s/|$//g" dmsal_v3.dat > dmsal_v3_stage.dat
\copy sales from dmsal_v3_prep.dat
 WITH (
    FORMAT csv,
    DELIMITER '|'
);
\! rm dmsal_v3_stage.dat


--
-- SUPPLEMENTARY DEMOGRAPHICS
--

\! sed "s/|[[:space:]]*$//g" dem1v3.dat > dem1v3_stage.dat
\copy supplementary_demographics from dem1v3_stage.dat
 WITH (
    FORMAT csv,
    DELIMITER '|'
);
\! rm dem1v3_stage.dat

