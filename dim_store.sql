with
	addres_table as (
			select
			a.addressid
			,a.city
			,a.addressline1
			,a.addressline2
			,a.postalcode
			,sp.name as stateprovince_name
			,cr.name as country_name
			,cr.countryregioncode
			from {{ ref('stg_address')}} a
			left join {{ ref('stg_stateprovince')}} sp
			on a.stateprovinceid = sp.stateprovinceid
			left join {{ ref('stg_countryregion')}} cr
			on sp.countryregioncode = cr.countryregioncode
	)
	,address_entity as (
			select
			be.businessentityid
			,a.*
			from {{ ref('stg_businessentity')}} be
			left join {{ ref('stg_businessentityaddress')}} bea
			on be.businessentityid = bea.businessentityid
			left join addres_table a
			on bea.addressid = a.addressid
	)
	,person_credit as (
			select 
			p.businessentityid
			,p.firstname
			,p.middlename
			,p.lastname
			,p.title
			,p.persontype
			,p.namestyle
			,p.suffix
			,c.creditcardid , c.cardtype , c.cardnumber
			,a.city
			,a.addressline1
			,a.addressline2
			,a.postalcode
			,a.stateprovince_name
			,a.country_name
			,a.countryregioncode
			from {{ ref ('stg_person')}} p 
			join {{ ref('stg_personcreditcard')}} p2 
			on p.businessentityid = p2.businessentityid 
			join {{ ref('stg_creditcard')}} c 
			on p2.creditcardid = c.creditcardid
			join address_entity a
			on p.businessentityid = a.businessentityid
	)
	
	, customer as (
			select 
				salespersonid
				,businessentityid
				,name 	
		
 	
			from {{ ref('stg_store')}} c
	)
	
	, selected as (
			select c.*, p.*
			from customer c
			inner join person_credit p
			on c.personid = p.businessentityid
	)
	, transformed as (
			select
			row_number() over(order by customerid) as sk_store, *
			from selected
	)
select * from transformed