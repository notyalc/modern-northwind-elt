{{
    config(
        materialized='table',
        database='northwind',
        schema='staging'
    )
}}

with source_data as (
    select
        "category_id"
        , "category_name"
        , "description"
    from {{ source('raw', 'categories') }}
)
select * 
from source_data