{{ config(materialized='table') }}

with dim_Status as (
    select distinct [Status] as [AmazonStatus],
        [Courier Status] as [CourierStatus]
    from 
        raw.raw_data
)

select row_number() over(order by [AmazonStatus], [CourierStatus]) as StatusID,
        *
    FROM
    dim_Status
