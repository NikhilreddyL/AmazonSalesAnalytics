{{ config(materialized='table') }}

with dim_locations as (
    SELECT
        DISTINCT
        [ship-city] as ShipCity,
        [ship-state] as ShipState ,
        [ship-country] as ShipCountry ,
        [ship-postal-code] as ShipPostalCode
    from 
        raw.raw_data
    )

select row_number() over(order by ShipCity, ShipState, ShipCountry, ShipPostalCode) as LocationID,
        *
    from dim_locations