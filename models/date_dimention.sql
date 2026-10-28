with cte as (
    select 
    
    TO_TIMESTAMP(started_at) as STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    HOUR(  TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
    {{day_type("started_at")}} AS DAY_TYPE,
    MONTH(  TO_TIMESTAMP(started_at)) AS MONTH,
    {{get_season('STARTED_AT')}} AS STATUS_OF_YEAR
    from 
    {{ ref("stg_bike") }}
    where started_at != 'started_at'
)
select * from 

cte