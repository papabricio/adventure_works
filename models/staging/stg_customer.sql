with
	source as (
			select 
				customerid
				,personid
				,storeid
				,modifieddate
				,territoryid
				,rowguid
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'customer')}}
	)
select * from source