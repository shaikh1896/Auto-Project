Select distinct *,Rank() over(order by Lebon_Score desc) as Rank from
(Select distinct model,year,mileage,Lebon_Site,Price,Lebon_Score from
(
SELECT A.model,A.year,A.mileage,A.Link as Lebon_Site,B.Link as Netti_link,A.Price,safe_divide(safe_cast(A.Year as int64),A.Price*(safe_Cast(trim(A.Mileage,'km') as int64)))*1000000  Lebon_Score, 
safe_divide(safe_cast(B.Year as int64),B.Price*(safe_Cast(replace(trim(B.Mileage,'km'),' ','') as int64) ))*1000000  Netti_Score,
 FROM `eminent-wares-365211.Vehicles_comp.First_site`
A  join `eminent-wares-365211.Vehicles_comp.Second_site` B on 
regexp_contains(lower(A.model),lower(B.model)) or regexp_contains(lower(B.model),lower(A.model))
and A.year = B.year)

where Lebon_Score >= Netti_Score)
order by Rank
