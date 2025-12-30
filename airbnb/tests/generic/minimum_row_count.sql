--generic custom test with parameter
{% test minimum_row_count(model, min_row_count) %}
{{ config(severity =  'warn') }} --add it here or in schema.yml
    SELECT COUNT(*) AS cnt 
    FROM {{ model }}
    HAVING COUNT(*) < {{ min_row_count }}
{% endtest %}