with
	selected as (
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
		
 	
			from {{ ref('stg_product')}}
	)
	, transformed as (
			select
			row_number() over(order by productid) as sk_product, *
			from selected
	)
select * from transformed