with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        camPGN_name AS campaign_name,
        CAST(ads_cost as FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
