{{config(
    materialized='table'
)}}

with raw_ratings as (
    select * from netflix.raw.raw_ratings
)

select 
userID as user_id,
movieId as movie_id,
rating,
To_Timestamp_LTZ(timestamp) as rating_timestamp
from raw_ratings