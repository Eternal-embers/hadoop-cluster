#!/bin/bash

# Create HDFS directory
hdfs dfs -mkdir -p /user/hadoop/input

# Upload test data to HDFS
echo 'Hello Hadoop
Hello World
Hadoop is great' > /tmp/input.txt
hdfs dfs -put /tmp/input.txt /user/hadoop/input

# Submit wordcount job
echo 'Submitting wordcount job...'
yarn jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.4.1.jar wordcount /user/hadoop/input /user/hadoop/output

# View wordcount results
echo 'Wordcount job completed. Viewing results...'
hdfs dfs -cat /user/hadoop/output/part-r-00000

# Submit pi job with parallelism of 8 and 20000 samples
echo 'Submitting pi job...'
yarn jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.4.1.jar pi 8 20000

# View pi results
echo 'Pi job completed. Viewing results...'
hdfs dfs -cat /user/hadoop/output/part-r-00000
