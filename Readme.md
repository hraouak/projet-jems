oozie : /opt/mapr/oozie/oozie-4.3.0/bin/oozie job -oozie "http://localhost:11000/oozie" -config hive/hive_job.properties -run


spark-submit : /opt/mapr/spark/spark-2.3.1/bin/spark-submit --class com.exemple.script.App target/project-1.0-SNAPSHOT.jar
