{{  config(materialized='table'             )
 }}

select 
    loadsmart_id,
    --lane,
    --quote_date
    --book_date
    --source_date
    --pickup_date
    --delivery_date
    book_price,
    source_price,
    pnl,
    mileage,
    equipment_type,
    hash(carrier_name,    carrier_rating ,    
    carrier_on_time_to_pickup,carrier_on_time_to_delivery,
    carrier_on_time_overall,vip_carrier) as carrier_id,
    --carrier_rating,
    --sourcing_channel,
    --vip_carrier
    carrier_dropped_us_count,
    --carrier_name,
    shipper_name,
    --lane,
    hash( trim(split_part(lane, '->', 1))  ) as from_route_id,
    hash( trim(split_part(lane, '->', 2))   ) as to_route_id,
    hash(has_mobile_app_tracking, has_macropoint_tracking,has_edi_tracking,
contracted_load,load_booked_autonomously,load_sourced_autonomously,load_was_cancelled,
carrier_on_time_to_pickup,carrier_on_time_to_delivery,carrier_on_time_overall,vip_carrier
) as flag_id,
    --carrier_on_time_to_pickup
    --carrier_on_time_to_delivery
    --carrier_on_time_overall
    --pickup_appointment_time
    --delivery_appointment_time
    --has_mobile_app_tracking
    --has_mobile_app_tracking_2
    --has_macropoint_tracking
    --has_edi_tracking
    --contracted_load
    --load_booked_autonomously
    --load_sourced_autonomously
    --load_was_cancelled
    TO_TIMESTAMP(quote_date, 'MM/DD/YYYY HH24:MI') as quote_date_parsed,
    TO_TIMESTAMP(book_date, 'MM/DD/YYYY HH24:MI') as book_date_parsed,
    TO_TIMESTAMP(source_date, 'MM/DD/YYYY HH24:MI') as source_date_parsed,
    TO_TIMESTAMP(pickup_date, 'MM/DD/YYYY HH24:MI') as pickup_date_parsed,
    TO_TIMESTAMP(delivery_date, 'MM/DD/YYYY HH24:MI') as delivery_date_parsed,
    TO_TIMESTAMP(pickup_appointment_time, 'MM/DD/YYYY HH24:MI') as pickup_appointment_time_parsed,
    TO_TIMESTAMP(delivery_appointment_time, 'MM/DD/YYYY HH24:MI') as delivery_appointment_time_parsed
from {{ ref('raw_datachallenge') }}