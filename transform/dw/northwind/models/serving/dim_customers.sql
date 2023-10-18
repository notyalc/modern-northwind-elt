with stg_customers as (
    select *
    from {{ref('stg_customers')}}
)
, transformed as (
    select 
        {{ dbt_utils.generate_surrogate_key(['stg_customers.customer_id']) }} as customer_id_key -- surrogate key
        , stg_customers.customer_id as customer_id
        , stg_customers.address as customer_address
        , stg_customers.city as customer_city
        , stg_customers.company_name as customer_company_name
        , stg_customers.contact_name as customer_contact_name
        , stg_customers.contact_title as customer_contact_title
        , stg_customers.country as customer_country
        , stg_customers.fax as customer_fax_number
        , stg_customers.phone as customer_phone_number
        , stg_customers.postal_code as customer_zip_code
    from stg_customers 
  )

select * from transformed