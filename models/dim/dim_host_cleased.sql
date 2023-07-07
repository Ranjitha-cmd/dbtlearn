{{
   config(
    materialized = 'view',
   ) 
}}





With dim_host_cleased as (

    Select * from {{ref('stg_host')}}

)


Select

    HOST_ID,
    NVL(
    host_name,
    'Anonymous'
    ) AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
From 
    dim_host_cleased

