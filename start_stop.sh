#!/bin/bash

hostname="maprdemo"

while true; do
    choice=$(dialog --clear --backtitle "Interactive Menu" --title "Select Action" \
                    --menu "Choose an action:" 15 40 4 \
                    1 "Start History Server" \
                    2 "Stop History Server" \
                    3 "Exit" 3>&1 1>&2 2>&3)

    case $choice in
        1)
            maprcli node services -name historyserver -action start -nodes $hostname
            maprcli node services -name spark-historyserver -action start -nodes $hostname
            dialog --infobox "History Server started." 5 30
            sleep 2
            ;;
        2)
            maprcli node services -name historyserver -action stop -nodes $hostname
            maprcli node services -name spark-historyserver -action stop -nodes $hostname
            dialog --infobox "History Server stopped." 5 30
            sleep 2
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
    esac
done
