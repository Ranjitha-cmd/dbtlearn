SELECT
    *
FROM
    {{ ref('dim_listing_cleased') }}
WHERE minimum_nights < 1
LIMIT 10
