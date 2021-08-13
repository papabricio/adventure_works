with
	source as (
			select 
				specialofferid
				,startdate
				,maxqty
				,modifieddate
				,type
				,discountpct
				,category
				,description
				,minqty
				,enddate
				,_sdc_received_at
				,rowguid
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'specialoffer')}}
	)
select * from source