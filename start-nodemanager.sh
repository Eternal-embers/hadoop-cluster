#!/bin/bash
# Set environment variables
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Start the NodeManager daemon
yarn --daemon start nodemanager

# Keep the container running
tail -f /dev/null
