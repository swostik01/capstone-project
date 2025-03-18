{% macro y_o_y_comparison(current_year, previous_year) %}
    ROUND((( {{ current_year }} - {{ previous_year }} ) / NULLIF({{ previous_year }}, 0)) * 100, 2) 
{% endmacro %}
