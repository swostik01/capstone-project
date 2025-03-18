{% snapshot customer_snapshot %}

{{
    config(
        target_schema='DBT_SSAHOO',
        unique_key='CustomerKey',
        strategy='timestamp',
        updated_at='LoadTime'
    )
}}

SELECT * FROM {{ source('raw_adventure', 'customer_lookup') }}

{% endsnapshot %}