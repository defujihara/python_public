{{ config(materialized='table') }}


SELECT  DISTINCT loadsmart_id ,sourcing_channel 
from {{ ref('raw_datachallenge') }}
WHERE sourcing_channel IS NOT null
--WHERE CARRIER_NAME  = 'Carrier 507487'