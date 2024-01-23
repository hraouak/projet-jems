#!/bin/bash

hostname="maprdemo"

while true; do
    choice=$(dialog --clear --backtitle "Menu" --title "Select Action" \
                    --menu "Choose an action:" 15 40 4 \
                    1 "Start Job History Server" \
                    2 "Stop Job History Server" \
                    3 "Start Spark History Server" \
                    4 "Stop Spark History Server "\
                    5 "Exit" 3>&1 1>&2 2>&3)

    case $choice in
        1)
            maprcli node services -name historyserver -action start -nodes $hostname
            dialog --infobox "Job History Server started." 5 30
            sleep 2
            ;;
        2)
            maprcli node services -name historyserver -action stop -nodes $hostname
            dialog --infobox "Job History Server stopped." 5 30
            sleep 2
            ;;

        3)
            maprcli node services -name spark-historyserver -action start -nodes $hostname
            dialog --infobox "Spark History Server started." 5 30
            sleep 2
            ;;        

        4)
            maprcli node services -name spark-historyserver -action stop -nodes $hostname
            dialog --infobox "Spark History Server stopped." 5 30
            sleep 2
            ;; 
        5)
            echo "Exiting..."
            exit 0
            ;;
    esac
done
clear
