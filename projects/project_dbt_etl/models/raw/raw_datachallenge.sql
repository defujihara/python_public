{{  config(materialized='table')
 }}

with remove_duplicates_dataset as  (
    SELECT 
    *,
    TO_TIMESTAMP(quote_date, 'MM/DD/YYYY HH24:MI') as quote_date_parsed,
    TO_TIMESTAMP(book_date, 'MM/DD/YYYY HH24:MI') as book_date_parsed,
    TO_TIMESTAMP(source_date, 'MM/DD/YYYY HH24:MI') as source_date_parsed,
    TO_TIMESTAMP(pickup_date, 'MM/DD/YYYY HH24:MI') as pickup_date_parsed,
    TO_TIMESTAMP(delivery_date, 'MM/DD/YYYY HH24:MI') as delivery_date_parsed,
    TO_TIMESTAMP(pickup_appointment_time, 'MM/DD/YYYY HH24:MI') as pickup_appointment_time_parsed,
    TO_TIMESTAMP(delivery_appointment_time, 'MM/DD/YYYY HH24:MI') as delivery_appointment_time_parsed,
    ROW_NUMBER() OVER(PARTITION BY loadsmart_id ORDER BY loadsmart_id) as rn
    FROM datachallenge ORDER BY loadsmart_id
    )

select *
from remove_duplicates_dataset
WHERE rn = 1