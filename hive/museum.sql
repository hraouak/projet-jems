DROP TABLE IF EXISTS museum;  
CREATE EXTERNAL TABLE museum ( 
museum_id STRING,
name STRING,
address STRING,
city STRING,
state STRING,
postal STRING,
country STRING,
phone STRING,
url STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/vagrant/projet-jems/data/museum';
