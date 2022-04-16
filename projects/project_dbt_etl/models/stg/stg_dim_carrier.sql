{{ config(materialized='table') }}


SELECT  DISTINCT 
--loadsmart_id ,
hash(carrier_name,
carrier_rating ,
carrier_on_time_to_pickup,
carrier_on_time_to_delivery,
carrier_on_time_overall,
vip_carrier) as carrier_id,
carrier_name,
carrier_rating ,
carrier_on_time_to_pickup,
carrier_on_time_to_delivery,
carrier_on_time_overall,
vip_carrier
from {{ ref('raw_datachallenge') }}
--WHERE carrier_rating IS NOT null
--WHERE CARRIER_NAME  = 'Carrier 507487'