{% macro get_season(x) %}

    CASE WHEN MONTH(  TO_TIMESTAMP({{x}})) IN (12,1,2)
        THEN 'WINTER'
        WHEN  MONTH(  TO_TIMESTAMP({{x}})) IN (5,3,4)
        THEN 'SPRING'
        WHEN MONTH(  TO_TIMESTAMP({{x}})) IN (8,6,7)
        THEN 'SUMMAR'
        ELSE 'AUTURN'
        END 

{% endmacro %}

{% macro day_type(x) %}
CASE 
    WHEN  DAYNAME(  TO_TIMESTAMP({{x}})) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END 

{% endmacro %}