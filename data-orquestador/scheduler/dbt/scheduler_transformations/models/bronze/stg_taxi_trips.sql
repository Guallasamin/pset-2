with
base as (
    select * from {{ source('origen', 'taxi_trips') }}
)
select
    --trip_id,
    vendorid::int as vendor_id,
    tpep_pickup_datetime::timestamp as pickup_ts,
    tpep_dropoff_datetime::timestamp as dropoff_ts,
    passenger_count::int as passengers_count,
    trip_distance::numeric(10,2) as trip_distance,
    pulocationid::int as pickup_location,
    dolocationid::int as dropoff_location,
    ratecodeid::int as rate_code_id,
    payment_type::int as payment_type,
    fare_amount::numeric(10,2) as fare_amount,
    tip_amount::numeric(10,2) as tip_amount,
    tolls_amount::numeric(10,2) as tolls_amount,
    total_amount::numeric(10,2) as total_amount,

    --derivada
    extract(epoch from (tpep_dropoff_datetime::timestamp - tpep_pickup_datetime::timestamp)) / 60.0 as trip_duration_minutes

from base