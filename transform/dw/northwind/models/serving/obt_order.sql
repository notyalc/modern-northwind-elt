with fct_order as (
    select * from {{ ref('fct_order') }}
)
, dim_product as (
    select * from {{ ref('dim_product') }}
)
, dim_supplier as (
    select * from {{ ref('dim_supplier') }}
)
, dim_employee as (
    select * from {{ ref('dim_employee') }}
)
, obt as (
    select
         {{ dbt_utils.star(from=ref('fct_order'), relation_alias='fct_order', except=[
            "product_id_key", "customer_id_key", "employee_key"]) }}
         , {{ dbt_utils.star(from=ref('dim_product'), relation_alias='dim_product', except=["product_id_key"]) }}
         , {{ dbt_utils.star(from=ref('dim_supplier'), relation_alias='dim_supplier', except=["supplier_id_key"]) }}
         , {{ dbt_utils.star(from=ref('dim_employee'), relation_alias='dim_employee', except=["employee_id_key"]) }}
    from fct_order
    left join dim_product on fct_order.product_id_key = dim_product.product_id_key 
    left join dim_supplier on fct_order.product_id_key = dim_supplier.product_id_key 
    left join dim_employee on fct_order.employee_id_key = dim_employee.employee_id_key 
)

select * 
from obt