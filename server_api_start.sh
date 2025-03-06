#!/bin/bash

# 定义日志文件路径和主程序名称
LOG_FILE="logs/api.log"
PID_FILE="service.pid"

# 启动服务并将输出重定向到日志文件
nohup python main.py > $LOG_FILE 2>&1 &

# 获取新启动进程的PID
PID=$!

# 将PID写入PID文件
echo $PID > $PID_FILE

echo "Service started with PID: $PID"