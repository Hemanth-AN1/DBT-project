with raw_links as (
    select * from netflix.raw.raw_links
)

select 
movieID as movie_id,
imdbId as imdb_id,
tmdbId as tmdb_id
from raw_links