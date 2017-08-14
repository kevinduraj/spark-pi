#!/bin/bash
#-----------------------------------------------------------------------------------#
  if [ "$1" == "0" ] 2>/dev/null; then
    echo "sbt clean package"
    sbt clean package

#-----------------------------------------------------------------------------------#
elif [ "$1" == "1" ] 2>/dev/null; then

time spark-submit                                       \
    --class "org.apache.spark.examples.SparkPi"         \
    --master "local[4]"                                 \
    --driver-memory   16G                               \
    --executor-memory 8G                                \
    target/scala-2.11/spark-pi_2.11-0.1.jar             \
    "100" 

#-----------------------------------------------------------------------------------#
elif [ "$1" == "2" ] 2>/dev/null; then

time spark-submit                                       \
    --class "org.apache.spark.examples.SparkPi"         \
    --master spark://69.13.39.34:7077                   \
    --driver-memory   16G                               \
    --executor-memory 8G                                \
    target/scala-2.11/spark-pi_2.11-0.1.jar             \
    "100" 

#-----------------------------------------------------------------------------------#
else

  echo "+---------------------------------------------+"
  echo "| ./run.sh 0 -- sbt clean && sbt package      |"
  echo "+---------------------------------------------+"
  echo "| ./run.sh 1 -- SparkPi Local                 |"
  echo "| ./run.sh 2 -- SparkPi Remote                |"
  echo "+---------------------------------------------+"

fi
#-----------------------------------------------------------------------------------#

