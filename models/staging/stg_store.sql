with
	source as (
			select 
				salespersonid
				,businessentityid
				,name
				,rowguid
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'store')}}
	)
select * from source