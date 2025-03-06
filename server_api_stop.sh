#!/bin/bash

# 定义PID文件路径
PID_FILE="service.pid"

# 检查PID文件是否存在
if [ ! -f "$PID_FILE" ]; then
    echo "No PID file found. Service might not be running."
    exit 1
fi

# 读取PID文件中的PID
PID=$(cat $PID_FILE)

# 检查进程是否正在运行
if ps -p $PID > /dev/null; then
    # 发送终止信号给进程
    kill -TERM $PID
    echo "Service with PID $PID has been terminated."

    # 删除PID文件
    rm $PID_FILE
else
    echo "Process with PID $PID is not running."
    # 删除无效的PID文件
    rm $PID_FILE
fi