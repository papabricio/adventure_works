with 
	product as (
			select * from {{ ref('dim_product')}}
	)
	,customer as (
			select * from {{ ref('dim_customers')}}
	)
	,get_reason as (
			select 
			ss.salesorderid
			,sr.salesreasonid
			,sr.reasontype
			,sr.name as reason_name
			from {{ ref('stg_salesheader_salesreason')}} ss
			join {{ ref('stg_salesreason')}} sr
			on ss.salesreasonid = sr.salesreasonid
	)
	,reason_order as (
			select
			customer.sk_customer
			,oh.salesorderid	 	 	
			,oh.salespersonid	 	 	
			,oh.currencyrateid
			,oh.territoryid
			,oh.taxamt	 	 	
			,oh.status
			,oh.orderdate 	
			,oh.subtotal
			,oh.freight
			,oh.duedate
			,oh.totaldue
			,oh.shipdate
			,sr.salesreasonid
			,sr.reasontype
			,sr.reason_name
			from {{ ref('stg_salesorderheader')}} oh
			join get_reason sr
			on oh.salesorderid = sr.salesorderid
			join customer
			on customer.customerid = oh.customerid
	)
	,detail_product as (
			select
			product.sk_product
			,od.salesorderdetailid
			,od.salesorderid
			,od.orderqty
			,od.unitprice
			,od.specialofferid
			,od.unitpricediscount
			,(od.unitprice * (1-od.unitpricediscount)) * od.orderqty as valor_liquido
			from {{ ref('stg_salesorderdetail')}} od
			join product
			on od.productid = product.productid
	)
	,final as (
			select
			dp.salesorderdetailid
			,dp.sk_product
			,ro.*
			,dp.orderqty
			,dp.unitprice
			,dp.specialofferid
			,dp.unitpricediscount
			,dp.valor_liquido
			from detail_product dp
			join reason_order ro
			on dp.salesorderid = ro.salesorderid
	)

select * from final