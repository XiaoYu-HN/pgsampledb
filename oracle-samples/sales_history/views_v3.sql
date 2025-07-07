
-- Creating MVs as tables ...

CREATE OR REPLACE VIEW profits
 AS SELECT 
	s.channel_id, 
	s.cust_id, 
	s.prod_id, 
	s.promo_id, 
	s.time_id,
	c.unit_cost, 
	c.unit_price, 
	s.amount_sold, 
	s.quantity_sold,
	c.unit_cost * s.quantity_sold TOTAL_COST
 FROM 
	costs c, sales s
 WHERE c.prod_id = s.prod_id
   AND c.time_id = s.time_id
   AND c.channel_id = s.channel_id
   AND c.promo_id = s.promo_id;

CREATE INDEX FW_PSC_S_MV_SUBCAT_BIX	
ON fweek_pscat_sales_mv(prod_subcategory);

CREATE INDEX FW_PSC_S_MV_CHAN_BIX
ON fweek_pscat_sales_mv(channel_id);

CREATE INDEX FW_PSC_S_MV_PROMO_BIX	
ON fweek_pscat_sales_mv(promo_id);

CREATE INDEX FW_PSC_S_MV_WD_BIX
ON fweek_pscat_sales_mv(week_ending_day);

--
-- The following MVs will be deleted and recreated to allow
-- the tablespace to be transported (see mkunplug.sql)
--

PROMPT Creating materialized views ...
PROMPT

CREATE MATERIALIZED VIEW cal_month_sales_mv
  AS
  SELECT   t.calendar_month_desc
  ,        sum(s.amount_sold) AS dollars
  FROM     sales s
  ,        times t
  WHERE    s.time_id = t.time_id
  GROUP BY t.calendar_month_desc;

CREATE MATERIALIZED VIEW fweek_pscat_sales_mv 
  AS
  SELECT   t.week_ending_day
  ,        p.prod_subcategory
  ,        sum(s.amount_sold) AS dollars
  ,        s.channel_id
  ,        s.promo_id
  FROM     sales s
  ,        times t
  ,        products p
  WHERE    s.time_id = t.time_id
  AND      s.prod_id = p.prod_id
  GROUP BY t.week_ending_day
  ,        p.prod_subcategory
  ,        s.channel_id
  ,        s.promo_id;
