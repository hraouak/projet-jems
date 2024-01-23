#!/bin/bash

path="/opt/mapr/spark/spark-2.3.1/sbin"



while true; do
echo "If you want to start the History Server, type 'start'."
echo "If you want to stop the History Server, type 'stop'."
echo -n "Your choice: "
read choice

if [ "$choice" == "start" ]; then
    bash $path/start-history-server.sh
    break
elif [ "$choice" == "stop" ]; then
    bash $path/stop-history-server.sh
    break
else
    echo "Invalid choice. Please enter 'start' or 'stop'."
fi
done
