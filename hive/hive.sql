DROP TABLE IF EXISTS museums;  
CREATE EXTERNAL TABLE museums ( 
region_administrative STRING,
departement STRING,
identifiant_museofile STRING,
commune STRING,
nom_officiel_du_musee STRING,
adresse STRING,
lieu STRING,
code_postal STRING,
telephone STRING,
url STRING,
latitude STRING,
longitude STRING,
ref_deps STRING,
geolocalisation STRING,
date_arrete_attribution_appellation STRING )
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LOCATION '/user/mapr/projet-jems/data';
