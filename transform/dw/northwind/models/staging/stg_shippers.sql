with source_data as (
    select
        shipper_id
        , company_name
        , phone
    from {{ source('raw', 'shippers') }}
)
select *
from source_data