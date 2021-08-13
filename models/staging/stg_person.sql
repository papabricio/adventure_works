with
	source as (
			select 
				businessentityid
				,firstname
				,middlename
				,lastname
				,title
				,persontype
				,namestyle
				,suffix
				,modifieddate
				,rowguid
				,emailpromotion
				,_sdc_sequence
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'person')}}
	)
select * from source