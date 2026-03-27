with
base as (
    select * from {{ source('origen', 'zones') }}
)
select
    locationid::int as location_id,
    borough,
    _zone as zone_name,
    service_zone
from base