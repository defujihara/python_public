{{ config(materialized='table') }}

select distinct --loadsmart_id, 
hash( trim(split_part(lane, '->', 1) ) ) as from_route_id,
trim(split_part(lane, '->', 1)) as from_route , 
trim(split_part(split_part(lane , '->', 1),',',1)) as from_city,
trim(split_part(split_part(lane , '->', 1),',',2)) as from_state
from {{ ref('raw_datachallenge') }}