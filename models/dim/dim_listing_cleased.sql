{{
   config(
    materialized = 'view',
   ) 
}}





WITH dim_listings_cleased as (
    Select * from {{ref('stg_listing')}}
    
)


Select 
    LISTING_ID, 
    LISTING_NAME, 
    LISTING_URL,
    ROOM_TYPE, 
    CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
    END AS minimum_nights,
    HOST_ID, 
    REPLACE(price_str, '$')::NUMBER(10, 2) AS price,
    CREATED_AT,
    UPDATED_AT
from 
    dim_listing_cleased