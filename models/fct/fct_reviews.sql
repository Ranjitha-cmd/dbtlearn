{{
   config(
    materialized = 'incremental',
    on_schema_change = 'fail'
   ) 
}}

WITH stg_reviews as (
    Select * from {{ref('stg_reviews')}}

)

Select * from stg_reviews where review_text is not null

{% if is_incremental() %}
AND review_date > (select max(review_date) from {{this}})
{% endif %}