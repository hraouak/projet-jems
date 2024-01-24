DROP TABLE IF EXISTS work;  
CREATE EXTERNAL TABLE work ( 
work_id STRING,
name STRING,
artist_id STRING,
style STRING,
museum_id STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/vagrant/projet-jems/data/work';
