with source_data as (
    select
        order_id
        , product_id
        , quantity
        , unit_price
        , discount
    from {{ source('raw', 'order_details') }}
)
select *
from source_data