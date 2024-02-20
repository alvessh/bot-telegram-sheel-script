#!/bin/bash
# alvessh

TOKEN=""
CHAT_ID=""

url="https://api.telegram.org/bot$TOKEN/sendMessage"

ping -c3 google.com > response.txt
echo "=====================================" >> response.txt
df -h >> response.txt

message=$(cat response.txt)

curl -s -X POST $url -d chat_id=$CHAT_ID -d text="$message"
