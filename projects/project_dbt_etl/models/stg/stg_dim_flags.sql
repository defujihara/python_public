{{ config(materialized='table') }}

select distinct --loadsmart_id,
hash(has_mobile_app_tracking, has_macropoint_tracking,has_edi_tracking,
contracted_load,load_booked_autonomously,load_sourced_autonomously,load_was_cancelled
) as flag_id,
has_mobile_app_tracking,
has_macropoint_tracking,
has_edi_tracking,
contracted_load,
load_booked_autonomously,
load_sourced_autonomously,
load_was_cancelled
from {{ ref('raw_datachallenge') }}