SELECT * FROM {{ ref('dim_listing_cleased') }} l
INNER JOIN {{ ref('fct_reviews') }} r
USING (listing_id)
WHERE l.created_at >= r.review_date