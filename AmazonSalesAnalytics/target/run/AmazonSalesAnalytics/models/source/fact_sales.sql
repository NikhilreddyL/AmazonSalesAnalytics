
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."fact_sales_temp_view" as 

with fact_sales as (
    SELECT
        [order id] as OrderID ,
        [Sales Channel] as SalesChannel ,
        [Currency] as Currency ,
        [b2b] as B2B ,
        [Status] as [AmazonStatus],
        [Courier Status] as [CourierStatus],
        Sum([Amount]) as [TotalAmount],
        Sum([Qty]) as ItemsQuantity,
        l.LocationID as [LocationID],
        f.FulfillmentID as [FulfillmentID],
        d.DateID as [DateID]
    FROM
        raw.raw_data r
    left join dwh.dim_locations l ON r.[Ship-City] = l.ShipCity 
        AND r.[Ship-State] = l.ShipState 
        AND r.[Ship-Country] = l.ShipCountry 
        AND r.[Ship-Postal-Code] = l.ShipPostalCode
    left join dwh.dim_fulfillment f on r.Fulfilment = f.FulfillmentType
        AND r.[ship-service-level] = f.ShipServiceLevel
        --AND r.[fulfilled-by] = f.FulfilledBy
    left join dwh.dim_date d on cast(r.[Date]  as Date) = d.[Date]
    --where Qty!=0 and Currency is not null
    group by 
        [order id],
        [Sales Channel],
        [Currency],
        [b2b],
        [Status],
        [Courier Status],
        l.LocationID,
        f.FulfillmentID,
        d.DateID
)   
select row_number() over(order by [OrderID]) as Order_Sk,
        *
    from 
        fact_sales;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[fact_sales] FROM [amazonsalesanalytics].[dwh].[fact_sales_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."fact_sales_temp_view";');



  