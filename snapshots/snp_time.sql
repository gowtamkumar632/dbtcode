{% snapshot snp_time %}
    {{
        config(
            target_schema='ACCOUNT_SCHEMA',
            target_database='HDFC_DB',
            strategy='timestamp',
            unique_key = 'id',
            invalidate_hard_deletes=true,
            updated_at='update_date'
        )
    }}

    select * from {{ source('s1', 'tt_time') }}
 {% endsnapshot %}