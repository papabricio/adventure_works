with
	source as (
			select 
				salesorderdetailid
				,salesorderid
				,productid
				,orderqty
				,unitprice
				,specialofferid
				,modifieddate	 	
				,carriertrackingnumber
				,unitpricediscount
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'salesorderdetail')}}
	)
select * from source