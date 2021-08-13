with
	source as (
			select 
				creditcardid
				,cardtype 	 	
				,expyear
				,modifieddate
				,expmonth
				,cardnumber
				,_sdc_received_at
				/*,_sdc_table_version	 	 	
				,_sdc_sequence
				,_sdc_batched_at
				,modifieddate	 	 	*/
		
 	
			from {{ source('adventure_works_elt', 'creditcard')}}
	)
select * from source