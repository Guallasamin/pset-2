{{
    config(materialized='table')
}}
with
trips as (
    select * from {{ ref('stg_taxi_trips') }}
),
zones as (
    select * from {{ ref('stg_zones') }}
)
select
    trips.*,
    zones_pickup.zone_name as pickup_location_name,
    zones_dropoff.zone_name as dropoff_location_name
    --coalesce(passengers_count, 0) as passengers_count
from trips
inner join zones as zones_pickup
    on trips.pickup_location = zones_pickup.location_id
inner join zones as zones_dropoff
    on trips.dropoff_location = zones_dropoff.location_id
where passengers_count is not null
     -- filtra resultados 