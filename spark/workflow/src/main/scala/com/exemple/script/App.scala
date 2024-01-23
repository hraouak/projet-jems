package com.exemple.script

import org.apache.spark.sql._
import java.io._


object App {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder.appName("Spark test").config("spark.sql.warehouse.dir", "/user/mapr/hive/warehouse").enableHiveSupport().getOrCreate()

    // Load dataframes
    val df1 = spark.table("artist")
    val df2 = spark.table("museum")
    val df3 = spark.table("work")

    val broadcasted1 = functions.broadcast(df1)
    val joined1 = broadcasted1.join(df3, broadcasted1("artist_id") === df3("artist_id"))
    val selected1 = joined1.select($"full_name".as("artist_name"),$"name".as("work_name"), $"museum_id")

    val broadcasted2 = functions.broadcast(df2)
    val joined2 = selected1.join(broadcasted2, selected1("museum_id") === broadcasted2("museum_id"))
    val result = joined2.select($"artist_name",$"work_name",$"name".as("museum_name"), $"city", $"country")

    // Drop redundant lines
    val cleaned_redundant = result.dropDuplicates()

    // Drop lines with NA values
    val cleaned_na = cleaned_redundant.na.drop()

    // Save the cleaned dataFrame as a JSON file
    val path = "/tmp/result"
    cleaned_na.write.format("json").mode("overwrite").save(path)

    spark.stop()
  }
}
