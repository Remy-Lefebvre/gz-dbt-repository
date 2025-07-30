select
    stg_raw__sales.date_date,
    stg_raw__sales.orders_id,
    stg_raw__sales.products_id,
    stg_raw__sales.revenue,
    stg_raw__sales.quantity,
    stg_raw__product.purchase_price,
    stg_raw__sales.revenue-stg_raw__product.purchase_price*stg_raw__sales.quantity AS margin,
    stg_raw__sales.quantity*stg_raw__product.purchase_price AS purchase_cost
from    
    {{ref('stg_raw__sales')}} 
LEFT JOIN
   {{ref('stg_raw__product')}} 
ON
    stg_raw__sales.products_id = stg_raw__product.products_id