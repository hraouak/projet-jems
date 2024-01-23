#!/bin/bash

#path="/opt/mapr/spark/spark-2.3.1/sbin"
path="/opt/mapr/hadoop/hadoop-2.7.0/sbin"
hostname="maprdemo"



while true; do
echo "If you want to start the History Server, type 'start'."
echo "If you want to stop the History Server, type 'stop'."
echo -n "Your choice: "
read choice

if [ "$choice" == "start" ]; then
    #$path/start-history-server.sh
    #mapred --daemon start historyserver
    #bash $path/mr-jobhistory-daemon.sh start historyserver
    #bash $path/yarn-daemon.sh start historyserver
    maprcli node services -name historyserver -action start -nodes $hostname
    break
elif [ "$choice" == "stop" ]; then
    #$path/stop-history-server.sh
    #mapred --daemon stop historyserver
    #bash $path/mr-jobhistory-daemon.sh stop historyserver
    #bash $path/yarn-daemon.sh stop historyserver
    maprcli node services -name historyserver -action stop -nodes $hostname
    break
else
    echo "Invalid choice. Please enter 'start' or 'stop'."
fi
done
