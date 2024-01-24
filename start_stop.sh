#!/bin/bash

hostname="maprdemo"
oozie="/opt/mapr/oozie/oozie-4.3.0/bin/oozie"
oozielink="http://localhost:11000/oozie"
configpath="hive/hive_job.properties"
sparksubmit="/opt/mapr/spark/spark-2.3.1/bin/spark-submit"
classname="com.exemple.script.App"
jarpath="spark/workflow/target/project-1.0-SNAPSHOT.jar"

expected_user="mapr@EXAMPLE.COM"

tickets=$(klist)
n=$(tickets | wc -l)
if [ n != 1]; then
    current_user=$(klist | awk '{print $3}')
    if [ "$current_user" == "$expected_user" ]; then
        while true; do
            choice=$(dialog --clear --backtitle "Menu" --no-ok --no-cancel \
                            --menu "Choose an action:" 17 50 20 \
                            0 "Job Oozie" \
                            1 "Job Spark" \
                            2 "Start Job History Server" \
                            3 "Stop Job History Server" \
                            4 "Start Spark History Server" \
                            5 "Stop Spark History Server" \
                            6 "Start all History Servers" \
                            7 "Stop all History Servers" \
                            8 "Exit" 3>&1 1>&2 2>&3)

            case $choice in
                0)
                    $oozie job -oozie $oozielink -config $configpath -run > /dev/null 2>&1
                    dialog --infobox "Job Oozie executed." 5 50
                    sleep 3
                    ;;
                1)
                    $sparksubmit --class $classname $jarpath > /dev/null 2>&1
                    dialog --infobox "Job Spark executed." 5 50
                    sleep 3
                    ;;

                2)
                    maprcli node services -name historyserver -action start -nodes $hostname
                    dialog --infobox "Job History Server started." 5 50
                    sleep 3
                    ;;
                3)
                    maprcli node services -name historyserver -action stop -nodes $hostname
                    dialog --infobox "Job History Server stopped." 5 50
                    sleep 3
                    ;;
                4)
                    maprcli node services -name spark-historyserver -action start -nodes $hostname
                    dialog --infobox "Spark History Server started." 5 50
                    sleep 3
                    ;;   
                5)
                    maprcli node services -name spark-historyserver -action stop -nodes $hostname
                    dialog --infobox "Spark History Server stopped." 5 50
                    sleep 3
                    ;;
                6)
                    maprcli node services -name historyserver -action start -nodes $hostname
                    maprcli node services -name spark-historyserver -action start -nodes $hostname
                    dialog --infobox "All History Servers are started." 5 50
                    sleep 3
                    ;; 
                7)
                    maprcli node services -name historyserver -action stop -nodes $hostname
                    maprcli node services -name spark-historyserver -action stop -nodes $hostname
                    dialog --infobox "All History Servers are stopped." 5 50
                    sleep 3
                    ;; 
                8)
                    echo "Exiting..."
                    break
                    ;;
            esac
        done
    fi
fi

clear
