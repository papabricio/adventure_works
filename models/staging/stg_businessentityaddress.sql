with
	source as (
			select 
				businessentityid
				,addressid
				,addresstypeid
				,modifieddate
				,rowguid
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'businessentityaddress')}}
	)
select * from source