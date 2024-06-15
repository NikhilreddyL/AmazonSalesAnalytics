

with dim_fulfillment as (
    select 
        DISTINCT
        Fulfilment as FulfillmentType,
        [ship-service-level] as ShipServiceLevel,
        [fulfilled-by] as FulfilledBy
    from 
        raw.raw_data
)

select row_number() over(order by FulfillmentType, ShipServiceLevel, FulfilledBy) as FulfillmentID ,
        *
    from dim_fulfillment