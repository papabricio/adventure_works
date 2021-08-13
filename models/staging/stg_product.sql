with
	source as (
			select 
				productid	 	 	
				,productsubcategoryid	 	 	
				,productmodelid	 	 	
				,sellenddate	 	 			
				,safetystocklevel	 	 	
				,finishedgoodsflag 	 	 	
				,class	 	 	
				,makeflag	 	 	
				,productnumber	 	 	
				,reorderpoint	 	 	 	 	
				,weightunitmeasurecode	 	 	
				,standardcost 	 	 	
				,name	 	 	
				,style	 	 	
				,sizeunitmeasurecode	 	 	
		
 	
			from {{ source('adventure_works_elt', 'product')}}
	)
select * from source