With raw_reviews as (
    Select * from {{(source('airbnb','reviews'))}}
)

Select
    LISTING_ID, 
    DATE as review_date, 
    REVIEWER_NAME,
    COMMENTS as review_text, 
    SENTIMENT  as review_sentiment
FROM 
    raw_reviews