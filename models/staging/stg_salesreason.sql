with
	source as (
			select 
				salesreasonid
				,reasontype
				,name
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'salesreason')}}
	)
select * from source