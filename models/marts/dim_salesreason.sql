with
	get_reason as (
			select 
			distinct ss.salesorderid
			,sr.salesreasonid
			,sr.reasontype
			,sr.name as reason_name
			from {{ ref('stg_salesheader_salesreason')}} ss
			join {{ ref('stg_salesreason')}} sr
			on ss.salesreasonid = sr.salesreasonid
	)
	, transformed as (
			select
			row_number() over(order by salesorderid) as sk_reason, *
			from get_reason
	)
select * from transformed