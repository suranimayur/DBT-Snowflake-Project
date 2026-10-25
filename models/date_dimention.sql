with cte as (
    select 
    
    TO_TIMESTAMP(started_at) as STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    HOUR(  TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
    CASE 
    WHEN  DAYNAME(  TO_TIMESTAMP(started_at)) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,
    MONTH(  TO_TIMESTAMP(started_at)) AS MONTH,
    CASE WHEN MONTH(  TO_TIMESTAMP(started_at)) IN (12,1,2)
        THEN 'WINTER'
        WHEN  MONTH(  TO_TIMESTAMP(started_at)) IN (5,3,4)
        THEN 'SPRING'
        WHEN MONTH(  TO_TIMESTAMP(started_at)) IN (8,6,7)
        THEN 'SUMMAR'
        ELSE 'AUTURN'
        END AS STATUS_OF_YEAR
    from 
    {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)
select * from 

cte