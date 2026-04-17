{% macro log_results(results) %}

{% for res in results %}

    {% set msg = (res.message | replace("'", " ") | replace("\n", " ")) %}

    insert into dbt_pipeline_audit
    values (
        current_date,
        '{{ res.node.name }}',
        '{{ res.node.resource_type }}',
        '{{ res.status }}',
        '{{ msg }}',
        current_timestamp
    );

{% endfor %}

{% endmacro %}