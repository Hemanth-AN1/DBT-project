{% snapshot snap_tags %}

{{  
    config(
        target_schema = 'snapshots',
        unique_key = ['movie_id', 'user_id', 'tag'],
        strategy = 'timestamp',
        updated_at = 'tag_timestamp',
        invalidate_hard_deletes = True
  )
}}

select 
    md5(concat(cast(movie_id as varchar), cast(user_id as varchar), tag)) as surrogate_key,
    user_id,
    movie_id,
    tag,
    cast(tag_timestamp as timestamp_ntz) as tag_timestamp
    from {{ref('src_tags')}}
    limit 100

{% endsnapshot %}