
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."fact_orderitems_temp_view" as 

WITH raw_data AS (
    SELECT
        [Order ID],
        SKU,
        Qty,
        Amount
    FROM raw.raw_data
),

product_dim AS (
    SELECT
        ProductID,
        SKU
    FROM dwh.dim_product
)

SELECT
    ROW_NUMBER() OVER (ORDER BY r.[Order ID], p.ProductID) AS OrderItemID,
    r.[Order ID] as OrderID,
    p.ProductID,
    r.Qty,
    r.Amount
FROM raw_data r
LEFT JOIN product_dim p ON r.SKU = p.SKU;;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[fact_orderitems] FROM [amazonsalesanalytics].[dwh].[fact_orderitems_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."fact_orderitems_temp_view";');



  