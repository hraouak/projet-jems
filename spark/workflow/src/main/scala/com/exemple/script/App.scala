package com.exemple.script

import org.apache.spark.sql.SparkSession
import java.io._


object App {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder.appName("Spark test").config("spark.sql.warehouse.dir", "/user/mapr/hive/warehouse").enableHiveSupport().getOrCreate()

    val df = spark.table("museums")
    val lineCount = df.count()
    val file = new File("/tmp/result.txt")
    val writer = new PrintWriter(file)
    writer.write(lineCount.toString)
    writer.close()

    spark.stop()
  }
}
