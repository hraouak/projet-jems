DROP TABLE IF EXISTS artist;  
CREATE EXTERNAL TABLE artist ( 
artist_id STRING,
full_name STRING,
first_name STRING,
middle_names STRING,
last_name STRING,
nationality STRING,
style STRING,
birth STRING,
death STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/vagrant/projet-jems/data/artist';
