WIth Raw as 
(
SELECT Link,Brand,model,lower(substr(replace(model,' ',''),0,4)) as model_modified,Price,Year,Mileage,safe_Cast(trim(Mileage,'km') as int64) as  Mileage_Transformed,

safe_divide(Price*(safe_Cast(trim(Mileage,'km') as int64)),safe_cast(Year as int64))*1000000  Score FROM `eminent-wares-365211.Vehicles_comp.First_site` 
Union all
SELECT Link,Brand,model,model as model_modified,Price,Year,Mileage,safe_Cast(replace(trim(Mileage,'km'),' ','') as int64) as Mileage_Transformed,
safe_divide(Price*(safe_Cast(replace(trim(Mileage,'km'),' ','') as int64) ),safe_cast(Year as int64))*1000000  Score,FROM `ProjectABC.Vehicles_comp.Second_site` 
where model is not null
)

Select * from
(
  -- Select *,Row_number() over (partition by Year order by Score) as Rank from Raw

Select 'Same Year' as Type,*,Row_number() over (partition by Year order by Score) as Rank from Raw
union all
Select 'Same Brand' as Type,*,Row_number() over (partition by Brand order by Score) as Rank from Raw
union all
Select 'Same model' as Type,*,Row_number() over (partition by model_modified order by Score) as Rank from Raw
union all
Select 'Same model same year' as Type,*,Row_number() over (partition by model_modified,year order by Score) as Rank from Raw
union all
Select 'Same Mileage' as Type,*,Row_number() over (partition by Mileage_Transformed order by Score) as Rank from Raw
)
