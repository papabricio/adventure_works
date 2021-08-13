with
	source as (
			select 
				addressid
				,stateprovinceid
				,city
				,addressline1
				,addressline2
				,postalcode
				,spatiallocation
				,_sdc_received_at
				,rowguid
				,modifieddate
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'address')}}
	)
select * from source