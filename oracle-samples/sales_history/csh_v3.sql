--- CREATE TABLE sales ---

CREATE TABLE sales (
    prod_id             NUMERIC                 NOT NULL,
    cust_id             NUMERIC                 NOT NULL,
    time_id             DATE            NOT NULL,
    channel_id          NUMERIC         NOT NULL,
    promo_id            NUMERIC                 NOT NULL,
    quantity_sold       NUMERIC(10,2)   NOT NULL,
    amount_sold         NUMERIC(10,2)   NOT NULL)
 PARTITION BY RANGE (time_id);

CREATE TABLE sales_1995 PARTITION OF sales
    FOR VALUES FROM (MINVALUE) TO ('1996-01-01');

CREATE TABLE sales_1996 PARTITION OF sales
    FOR VALUES FROM ('1996-01-01') TO ('1997-01-01');

CREATE TABLE sales_h1_1997 PARTITION OF sales
    FOR VALUES FROM ('1997-01-01') TO ('1997-07-01');

CREATE TABLE sales_h2_1997 PARTITION OF sales
    FOR VALUES FROM ('1997-07-01') TO ('1998-01-01');

CREATE TABLE sales_q1_1998 PARTITION OF sales
    FOR VALUES FROM ('1998-01-01') TO ('1998-04-01');

CREATE TABLE sales_q2_1998 PARTITION OF sales
    FOR VALUES FROM ('1998-04-01') TO ('1998-07-01');

CREATE TABLE sales_q3_1998 PARTITION OF sales
    FOR VALUES FROM ('1998-07-01') TO ('1998-10-01');

CREATE TABLE sales_q4_1998 PARTITION OF sales
    FOR VALUES FROM ('1998-10-01') TO ('1999-01-01');

CREATE TABLE sales_q1_1999 PARTITION OF sales
    FOR VALUES FROM ('1999-01-01') TO ('1999-04-01');

CREATE TABLE sales_q2_1999 PARTITION OF sales
    FOR VALUES FROM ('1999-04-01') TO ('1999-07-01');

CREATE TABLE sales_q3_1999 PARTITION OF sales
    FOR VALUES FROM ('1999-07-01') TO ('1999-10-01');

CREATE TABLE sales_q4_1999 PARTITION OF sales
    FOR VALUES FROM ('1999-10-01') TO ('2000-01-01');

CREATE TABLE sales_q1_2000 PARTITION OF sales
    FOR VALUES FROM ('2000-01-01') TO ('2000-04-01');

CREATE TABLE sales_q2_2000 PARTITION OF sales
    FOR VALUES FROM ('2000-04-01') TO ('2000-07-01');

CREATE TABLE sales_q3_2000 PARTITION OF sales
    FOR VALUES FROM ('2000-07-01') TO ('2000-10-01');

CREATE TABLE sales_q4_2000 PARTITION OF sales
    FOR VALUES FROM ('2000-10-01') TO ('2001-01-01');

CREATE TABLE sales_q1_2001 PARTITION OF sales
    FOR VALUES FROM ('2001-01-01') TO ('2001-04-01');

CREATE TABLE sales_q2_2001 PARTITION OF sales
    FOR VALUES FROM ('2001-04-01') TO ('2001-07-01');

CREATE TABLE sales_q3_2001 PARTITION OF sales
    FOR VALUES FROM ('2001-07-01') TO ('2001-10-01');

CREATE TABLE sales_q4_2001 PARTITION OF sales
    FOR VALUES FROM ('2001-10-01') TO ('2002-01-01');

CREATE TABLE sales_q1_2002 PARTITION OF sales
    FOR VALUES FROM ('2002-01-01') TO ('2002-04-01');

CREATE TABLE sales_q2_2002 PARTITION OF sales
    FOR VALUES FROM ('2002-04-01') TO ('2002-07-01');

CREATE TABLE sales_q3_2002 PARTITION OF sales
    FOR VALUES FROM ('2002-07-01') TO ('2002-10-01');

CREATE TABLE sales_q4_2002 PARTITION OF sales
    FOR VALUES FROM ('2002-10-01') TO ('2003-01-01');

CREATE TABLE sales_q1_2003 PARTITION OF sales
    FOR VALUES FROM ('2003-01-01') TO ('2003-04-01');

CREATE TABLE sales_q2_2003 PARTITION OF sales
    FOR VALUES FROM ('2003-04-01') TO ('2003-07-01');

CREATE TABLE sales_q3_2003 PARTITION OF sales
    FOR VALUES FROM ('2003-07-01') TO ('2003-10-01');

CREATE TABLE sales_q4_2003 PARTITION OF sales
    FOR VALUES FROM ('2003-10-01') TO ('2004-01-01');

--- CREATE TABLE costs --- 

CREATE TABLE costs (
    prod_id     NUMERIC         NOT NULL,
    time_id     DATE            NOT NULL,
    promo_id    NUMERIC         NOT NULL,
    channel_id  NUMERIC         NOT NULL,
    unit_cost   NUMERIC(10,2)   NOT NULL,
    unit_price  NUMERIC(10,2)   NOT NULL
) PARTITION BY RANGE (time_id);

CREATE TABLE costs_1995 PARTITION OF costs
    FOR VALUES FROM (MINVALUE) TO ('1996-01-01');

CREATE TABLE costs_1996 PARTITION OF costs
    FOR VALUES FROM ('1996-01-01') TO ('1997-01-01');

CREATE TABLE costs_h1_1997 PARTITION OF costs
    FOR VALUES FROM ('1997-01-01') TO ('1997-07-01');

CREATE TABLE costs_h2_1997 PARTITION OF costs
    FOR VALUES FROM ('1997-07-01') TO ('1998-01-01');

CREATE TABLE costs_q1_1998 PARTITION OF costs
    FOR VALUES FROM ('1998-01-01') TO ('1998-04-01');

CREATE TABLE costs_q2_1998 PARTITION OF costs
    FOR VALUES FROM ('1998-04-01') TO ('1998-07-01');

CREATE TABLE costs_q3_1998 PARTITION OF costs
    FOR VALUES FROM ('1998-07-01') TO ('1998-10-01');

CREATE TABLE costs_q4_1998 PARTITION OF costs
    FOR VALUES FROM ('1998-10-01') TO ('1999-01-01');

CREATE TABLE costs_q1_1999 PARTITION OF costs
    FOR VALUES FROM ('1999-01-01') TO ('1999-04-01');

CREATE TABLE costs_q2_1999 PARTITION OF costs
    FOR VALUES FROM ('1999-04-01') TO ('1999-07-01');

CREATE TABLE costs_q3_1999 PARTITION OF costs
    FOR VALUES FROM ('1999-07-01') TO ('1999-10-01');

CREATE TABLE costs_q4_1999 PARTITION OF costs
    FOR VALUES FROM ('1999-10-01') TO ('2000-01-01');

CREATE TABLE costs_q1_2000 PARTITION OF costs
    FOR VALUES FROM ('2000-01-01') TO ('2000-04-01');

CREATE TABLE costs_q2_2000 PARTITION OF costs
    FOR VALUES FROM ('2000-04-01') TO ('2000-07-01');

CREATE TABLE costs_q3_2000 PARTITION OF costs
    FOR VALUES FROM ('2000-07-01') TO ('2000-10-01');

CREATE TABLE costs_q4_2000 PARTITION OF costs
    FOR VALUES FROM ('2000-10-01') TO ('2001-01-01');

CREATE TABLE costs_q1_2001 PARTITION OF costs
    FOR VALUES FROM ('2001-01-01') TO ('2001-04-01');

CREATE TABLE costs_q2_2001 PARTITION OF costs
    FOR VALUES FROM ('2001-04-01') TO ('2001-07-01');

CREATE TABLE costs_q3_2001 PARTITION OF costs
    FOR VALUES FROM ('2001-07-01') TO ('2001-10-01');

CREATE TABLE costs_q4_2001 PARTITION OF costs
    FOR VALUES FROM ('2001-10-01') TO ('2002-01-01');

CREATE TABLE costs_q1_2002 PARTITION OF costs
    FOR VALUES FROM ('2002-01-01') TO ('2002-04-01');

CREATE TABLE costs_q2_2002 PARTITION OF costs
    FOR VALUES FROM ('2002-04-01') TO ('2002-07-01');

CREATE TABLE costs_q3_2002 PARTITION OF costs
    FOR VALUES FROM ('2002-07-01') TO ('2002-10-01');

CREATE TABLE costs_q4_2002 PARTITION OF costs
    FOR VALUES FROM ('2002-10-01') TO ('2003-01-01');

CREATE TABLE costs_q1_2003 PARTITION OF costs
    FOR VALUES FROM ('2003-01-01') TO ('2003-04-01');

CREATE TABLE costs_q2_2003 PARTITION OF costs
    FOR VALUES FROM ('2003-04-01') TO ('2003-07-01');

CREATE TABLE costs_q3_2003 PARTITION OF costs
    FOR VALUES FROM ('2003-07-01') TO ('2003-10-01');

CREATE TABLE costs_q4_2003 PARTITION OF costs
    FOR VALUES FROM ('2003-10-01') TO ('2004-01-01');


--- CREATE TABLE times ---

CREATE TABLE times (
    time_id 			DATE 		NOT NULL,
    day_name 			VARCHAR(9)	NOT NULL,
    day_number_in_week 		NUMERIC(1)	NOT NULL,
    day_number_in_month 	NUMERIC(2)	NOT NULL,
    calendar_week_number 	NUMERIC(2)	NOT NULL,
    fiscal_week_number 		NUMERIC(2)	NOT NULL,
    week_ending_day 		DATE		NOT NULL,
    week_ending_day_id	 	NUMERIC		NOT NULL,
    calendar_month_number 	NUMERIC(2)	NOT NULL,
    fiscal_month_number 	NUMERIC(2)	NOT NULL,
    calendar_month_desc 	VARCHAR(8)	NOT NULL,
    calendar_month_id	 	NUMERIC		NOT NULL,
    fiscal_month_desc 		VARCHAR(8)	NOT NULL,
    fiscal_month_id	 	NUMERIC		NOT NULL,
    days_in_cal_month 		NUMERIC		NOT NULL,
    days_in_fis_month 		NUMERIC		NOT NULL,
    end_of_cal_month 		DATE		NOT NULL,
    end_of_fis_month 		DATE		NOT NULL,
    calendar_month_name 	VARCHAR(9)	NOT NULL,
    fiscal_month_name 		VARCHAR(9)	NOT NULL,
    calendar_quarter_desc 	CHAR(7)		NOT NULL,
    calendar_quarter_id	 	NUMERIC		NOT NULL,
    fiscal_quarter_desc 	CHAR(7)		NOT NULL,
    fiscal_quarter_id	 	NUMERIC		NOT NULL,
    days_in_cal_quarter 	NUMERIC		NOT NULL,
    days_in_fis_quarter 	NUMERIC		NOT NULL,
    end_of_cal_quarter 		DATE		NOT NULL,
    end_of_fis_quarter 		DATE		NOT NULL,
    calendar_quarter_number 	NUMERIC(1)	NOT NULL,
    fiscal_quarter_number 	NUMERIC(1)	NOT NULL,
    calendar_year 		NUMERIC(4)	NOT NULL,
    calendar_year_id 		NUMERIC		NOT NULL,
    fiscal_year 		NUMERIC(4)	NOT NULL,
    fiscal_year_id 		NUMERIC		NOT NULL,
    days_in_cal_year 		NUMERIC		NOT NULL,
    days_in_fis_year 		NUMERIC		NOT NULL,
    end_of_cal_year 		DATE		NOT NULL,
    end_of_fis_year 		DATE		NOT NULL );

CREATE TABLE products (
    prod_id 			NUMERIC(6) 	NOT NULL,
    prod_name 			VARCHAR(50)	NOT NULL,
    prod_desc 			VARCHAR(4000)	NOT NULL,
    prod_subcategory 		VARCHAR(50)	NOT NULL,
    prod_subcategory_id		NUMERIC		NOT NULL,
    prod_subcategory_desc	VARCHAR(2000)	NOT NULL,
    prod_category 		VARCHAR(50)	NOT NULL,
    prod_category_id 		NUMERIC		NOT NULL,
    prod_category_desc 		VARCHAR(2000)	NOT NULL,
    prod_weight_class 		NUMERIC(3)	NOT NULL,
    prod_unit_of_measure 	VARCHAR(20)	,
    prod_pack_size 		VARCHAR(30)	NOT NULL,
    supplier_id 		NUMERIC(6)	NOT NULL,
    prod_status 		VARCHAR(20)	NOT NULL,
    prod_list_price 		NUMERIC(8,2)	NOT NULL,
    prod_min_price 		NUMERIC(8,2)	NOT NULL,
    prod_total 			VARCHAR(13)	NOT NULL,
    prod_total_id 		NUMERIC		NOT NULL,
    prod_src_id        		NUMERIC		,
    prod_eff_from      		DATE		,
    prod_eff_to        		DATE		,
    prod_valid         		VARCHAR(1)	);

CREATE TABLE channels (
    channel_id 			NUMERIC	 	NOT NULL,
    channel_desc 		VARCHAR(20)	NOT NULL,
    channel_class 		VARCHAR(20)	NOT NULL,
    channel_class_id 		NUMERIC		NOT NULL,
    channel_total 		VARCHAR(13)	NOT NULL,
    channel_total_id 		NUMERIC		NOT NULL);

CREATE TABLE promotions (
    promo_id 			NUMERIC(6) 	NOT NULL,
    promo_name 			VARCHAR(30)	NOT NULL,
    promo_subcategory 		VARCHAR(30)	NOT NULL,
    promo_subcategory_id 	NUMERIC		NOT NULL,
    promo_category 		VARCHAR(30)	NOT NULL,
    promo_category_id 		NUMERIC		NOT NULL,
    promo_cost 			NUMERIC(10,2)	NOT NULL,
    promo_begin_date 		DATE		NOT NULL,
    promo_end_date 		DATE		NOT NULL,
    promo_total			VARCHAR(15)	NOT NULL,
    promo_total_id 		NUMERIC		NOT NULL);

CREATE TABLE customers (
    cust_id 			NUMERIC 		NOT NULL,
    cust_first_name 		VARCHAR(20)	NOT NULL,
    cust_last_name 		VARCHAR(40)	NOT NULL,
    cust_gender 		CHAR(1)		NOT NULL,
    cust_year_of_birth 		NUMERIC(4)	NOT NULL,
    cust_marital_status 	VARCHAR(20)	,
    cust_street_address 	VARCHAR(40)	NOT NULL,
    cust_postal_code 		VARCHAR(10)	NOT NULL,
    cust_city 			VARCHAR(30)	NOT NULL,
    cust_city_id 		NUMERIC		NOT NULL,
    cust_state_province 	VARCHAR(40)	NOT NULL,
    cust_state_province_id 	NUMERIC		NOT NULL,
    country_id	 		NUMERIC		NOT NULL,
    cust_main_phone_number 	VARCHAR(25)	NOT NULL,
    cust_income_level 		VARCHAR(30)	,
    cust_credit_limit 		NUMERIC		,
    cust_email 			VARCHAR(50)	,
    cust_total 			VARCHAR(14)	NOT NULL,
    cust_total_id 		NUMERIC		NOT NULL,
    cust_src_id        		NUMERIC		,
    cust_eff_from      		DATE		,
    cust_eff_to        		DATE		,
    cust_valid         		VARCHAR(1)	);

CREATE TABLE countries (
    country_id 			NUMERIC		NOT NULL,
    country_iso_code 		CHAR(2)		NOT NULL,
    country_name 		VARCHAR(40)	NOT NULL,
    country_subregion 		VARCHAR(30)	NOT NULL,
    country_subregion_id 	NUMERIC		NOT NULL,
    country_region 		VARCHAR(20)	NOT NULL,
    country_region_id 		NUMERIC		NOT NULL,
    country_total 		VARCHAR(11)	NOT NULL,
    country_total_id 		NUMERIC		NOT NULL,
    country_name_hist 		VARCHAR(40));


CREATE TABLE supplementary_demographics
  ( CUST_ID          NUMERIC not null,
    EDUCATION        VARCHAR(21),
    OCCUPATION       VARCHAR(21),
    HOUSEHOLD_SIZE   VARCHAR(21),
    YRS_RESIDENCE    NUMERIC,
    AFFINITY_CARD    NUMERIC(10),
    bulk_pack_diskettes NUMERIC(10),
    flat_panel_monitor  NUMERIC(10),
    home_theater_package NUMERIC(10),
    bookkeeping_application NUMERIC(10),
    printer_supplies NUMERIC(10),
    y_box_games NUMERIC(10),
    os_doc_set_kanji NUMERIC(10),
    COMMENTS         VARCHAR(4000));

