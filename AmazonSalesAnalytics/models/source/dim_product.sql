{{ config(materialized='table') }}

with cte_product as 
        (
        SELECT
            distinct 
            SKU,
            Style,
            Category,
            SIZE,
            ASIN
        from RAW.raw_data
    )

--INSERT into dwh.dim_product
select row_number() over(order by SKU, Style, Category, SIZE, ASIN) as ProductID,
        *
     from cte_product