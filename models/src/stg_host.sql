-- With raw_hosts as (
--     Select * from {{(source('airbnb','hosts'))}}
-- )

-- Select
--    ID as host_id, 
--    NAME as host_name,
--    IS_SUPERHOST,
--    CREATED_AT,
--    UPDATED_AT
-- FROM
--     raw_hosts


    WITH raw_hosts AS (
  SELECT
    ID ,
    NAME,
    IS_SUPERHOST,
   CREATED_AT,
   UPDATED_AT,
    ROW_NUMBER() OVER (PARTITION BY ID ORDER BY ID) AS row_num
  FROM
    {{(source('airbnb','hosts'))}}
)
SELECT
  ID as host_id, 
   NAME as host_name,
   IS_SUPERHOST,
   CREATED_AT,
   UPDATED_AT
FROM
  raw_hosts
WHERE
  row_num = 1
