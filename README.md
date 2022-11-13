# Auto-Project
Link to Data studio Report - https://datastudio.google.com/s/udLJSd14KoI
About the Project
# Objective of the Project
>> One of the Objective of this Project was to reduce the time of comparing the old cars in two different site and getting the car which is best out of these 2 website      in terms of Price, Mileage and Year or manufacturing. 


#  Process Followed For Project
>> The Data was scraped from the two old Cars Sellers In Franch - www.leboncoin.fr and www.nettiauto.com
>> The ETL was developed in Cloud Functions by GCP. It runs daily in the morning and scrapes the data. Google Bigquery was choosen to store the data. 
>> The Score / Formula was developed on the basis of Price, Mileage and Year of make of the car which can help in selecting the better car and can help in Saving the        time of manually doing the analysis. 

# Limitation of Project - 
>> This is limited to comparing the car within sam category or same model or cars which have same year of manufacturing. Factors such as Registration of car, Colour,        Physical conditions are not being taken into account.
