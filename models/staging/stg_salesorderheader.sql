with
	source as (
			select 
				salesorderid	 	 	
				,creditcardid
				,salespersonid	 	 	
				,customerid
				,shipmethodid	 	 	
				,currencyrateid
				,territoryid
				,purchaseordernumber
				,billtoaddressid	 	 	
				,taxamt	 	 	
				,shiptoaddressid	 	 	
				,onlineorderflag	 	 	
				,status
				,orderdate 	
				,creditcardapprovalcode
				,subtotal
				,revisionnumber
				,freight
				,duedate
				,totaldue
				,shipdate
				,accountnumber
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'salesorderheader')}}
	)
select * from source