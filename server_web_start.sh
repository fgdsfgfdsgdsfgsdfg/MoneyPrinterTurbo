#!/bin/bash

# 定义日志文件路径和主程序名称
LOG_FILE="logs/webui.log"
PID_FILE="service_web.pid"
# If you could not download the model from the official site, you can use the mirror site.
# Just remove the comment of the following line .
# 如果你无法从官方网站下载模型，你可以使用镜像网站。
# 只需要移除下面一行的注释即可。
# export HF_ENDPOINT=https://hf-mirror.com

# 启动服务并将输出重定向到日志文件
nohup streamlit run ./webui/Main.py --browser.serverAddress="0.0.0.0" --server.enableCORS=True --browser.gatherUsageStats=False > $LOG_FILE 2>&1 &
# 获取新启动进程的PID
PID=$!
# 将PID写入PID文件
echo $PID > $PID_FILE
echo "Service started with PID: $PID"