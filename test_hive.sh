#!/bin/bash

# HiveServer 的 IP 和端口（在容器内部通常使用 localhost）
HIVE_SERVER="localhost"
HIVE_PORT="10000"

# Beeline 连接命令
BEELINE_CMD="beeline -u jdbc:hive2://$HIVE_SERVER:$HIVE_PORT"

# 执行并打印 Beeline 命令的输出
echo "Connecting to HiveServer..."
echo "Executing SHOW DATABASES;"
$BEELINE_CMD << EOF
SHOW DATABASES;
EOF

echo "Creating database test_db"
$BEELINE_CMD << EOF
CREATE DATABASE IF NOT EXISTS test_db;
EOF

echo "Using test_db"
$BEELINE_CMD << EOF
USE test_db;
EOF

echo "Creating table test_table"
$BEELINE_CMD << EOF
CREATE TABLE IF NOT EXISTS test_table (id INT, name STRING);
EOF

echo "Inserting data into test_table"
$BEELINE_CMD << EOF
INSERT INTO test_table VALUES (1, 'test');
EOF

echo "Querying test_table"
$BEELINE_CMD << EOF
SELECT * FROM test_table;
EOF

echo "Cleaning up test database and table..."
$BEELINE_CMD << EOF
DROP TABLE test_table;
DROP DATABASE test_db;
EOF

echo "Hive Server test completed."
