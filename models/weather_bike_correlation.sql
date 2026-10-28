WITH CTE AS (
    SELECT T.*

    FROM {{ ref('trip_fact') }} AS T
    LEFT JOIN {{ ref('daily_weather') }} W 
    ON t.TRIP_DATE = w.daily_weather

)
SELECT * FROM CTE