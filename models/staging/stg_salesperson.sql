with
	source as (
			select 
				businessentityid
				,territoryid
				,salesquota
				,saleslastyear
				,commissionpct
				,bonus
				,salesytd
				,rowguid
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'salesperson')}}
	)
select * from source