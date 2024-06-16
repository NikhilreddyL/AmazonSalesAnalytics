with cte_product as (SELECT
    distinct 
    Category,
    SIZE,
    SKU,
    Style,
    ASIN
from dbo.raw_data)

select Category,
        SIZE,
        SKU,
        Style,
        ASIN
    from cte_product