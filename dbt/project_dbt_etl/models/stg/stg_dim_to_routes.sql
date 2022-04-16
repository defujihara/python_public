{{ config(materialized='table') }}

select distinct --loadsmart_id, 

hash( trim(split_part(lane, '->', 2))   ) as to_route_id,
trim(split_part(lane, '->', 2)) as to_route , 
trim(split_part(split_part(lane , '->', 2),',',1)) as to_city,
trim(split_part(split_part(lane , '->', 2),',',2)) as to_state
from {{ ref('raw_datachallenge') }}