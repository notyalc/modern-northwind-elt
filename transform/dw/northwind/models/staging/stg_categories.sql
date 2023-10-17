with source_data as (
    select
        category_id
        , category_name
        , description
        , picture
    from {{ source('raw', 'categories') }}
)
select *
from source_data