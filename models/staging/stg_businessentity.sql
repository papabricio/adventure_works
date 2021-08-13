with
	source as (
			select 
				businessentityid
				,modifieddate
				,rowguid
				,_sdc_batched_at
				,_sdc_sequence
				,_sdc_table_version
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'businessentity')}}
	)
select * from source