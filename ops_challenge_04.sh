#!/bin/bash
#
# Author: Jamie Giannini

# Objectives: Write a bash script that clears the contents of these logs:
# [X] /var/log/syslog
# [X] /var/log/wtmp
# Print to screen the before and after of the contents of each file.

function clear_logs () {
while true #setting to true kicks off my while loop 
do
echo -e "\nChoose the log you would like to clear:\n[1] System Log\n[2] Wtmp Log\n[3] Kernel Log\n[4] Bash History\n[5] Exit Program"
read -r user_input
    if [ "$user_input" == 1 ] #check for input
        then
        echo -e "\n######################### Printing log contents... #########################\n"
        command cat /var/log/syslog #stores all global system activity data
        echo -e "\n######################### End #########################"

        echo -e "\nReady to clear, enter [Y or N]:"
        read -r user_reply

        if [ "$user_reply" == "Y" ] || [ "$user_reply" == "y" ] || [ "$user_reply" == "Yes" ] || [ "$user_reply" == "yes" ] 
            then
            echo -e "\n######################### Clearing log... #########################\n"
            command >/var/log/syslog #now clear log
            echo -e "\n######################### End #########################"

            echo -e "\nCleared System Log successfully"
            echo -e "\n######################### Printing current System Log contents... #########################\n"
            command cat /var/log/syslog
        
        elif [ "$user_reply" == "N" ] || [ "$user_reply" == "n" ] || [ "$user_reply" == "No" ] || [ "$user_reply" == "no" ]
            then
            echo -e "\nOkay clear logs canceled"
        else
            echo "Invalid input"
        fi
    elif [ "$user_input" == 2 ]
        then
        echo -e "\n######################### Printing log contents... #########################\n"
        command cat /var/log/wtmp # historical data of user logins at which terminals, logouts, system events and current status of the system, system boot time (used by uptime) etc.
        echo -e "\n######################### End #########################"

        echo -e "\nReady to clear, enter [Y or N]:"
        read -r user_reply

        if [ "$user_reply" == "Y" ] || [ "$user_reply" == "y" ] || [ "$user_reply" == "Yes" ] || [ "$user_reply" == "yes" ] 
            then
            echo -e "\n######################### Clearing log... #########################\n"
            command >/var/log/wtmp
            echo -e "\n######################### End #########################"

            echo -e "\nCleared Wtmp Log successfully"
            echo -e "\n######################### Printing current Wtmp Log contents... #########################\n"
            command cat /var/log/wtmp
        
        elif [ "$user_reply" == "N" ] || [ "$user_reply" == "n" ] || [ "$user_reply" == "No" ] || [ "$user_reply" == "no" ]
            then
            echo -e "\nOkay clear logs canceled"
        else
            echo "Invalid input"
        fi
    elif [ "$user_input" == 3 ]
        then
        echo -e "\n######################### Printing log contents... #########################\n"
        command cat /var/log/kern.log # stores kernel events, errors, and warning logs
        echo -e "\n######################### End #########################"

        echo -e "\nReady to clear, enter [Y or N]:"
        read -r user_reply

        if [ "$user_reply" == "Y" ] || [ "$user_reply" == "y" ] || [ "$user_reply" == "Yes" ] || [ "$user_reply" == "yes" ] 
            then
            echo -e "\n######################### Clearing log... #########################\n"
            command >/var/log/kern.log
            echo -e "\n######################### End #########################"

            echo -e "\nCleared Kernel Log successfully"
            echo -e "\n######################### Printing current Kernel Log contents... #########################\n"
            command cat /var/log/kern.log
        
        elif [ "$user_reply" == "N" ] || [ "$user_reply" == "n" ] || [ "$user_reply" == "No" ] || [ "$user_reply" == "no" ]
            then
            echo -e "\nOkay clear logs canceled"
        else
            echo "Invalid input"
        fi
    elif [ "$user_input" == 4 ] 
        then
        echo -e "\n######################### Printing Bash history contents... #########################\n"
        command cat "$HOME"/.bash_history #all bash command history
        echo -e "\n######################### End #########################"

        echo -e "\nReady to clear, enter [Y or N]:"
        read -r user_reply

        if [ "$user_reply" == "Y" ] || [ "$user_reply" == "y" ] || [ "$user_reply" == "Yes" ] || [ "$user_reply" == "yes" ] 
            then
            echo -e "\n######################### Clearing history... #########################\n"
            command >"$HOME"/.bash_history
            echo -e "\n######################### End #########################"

            echo -e "\nCleared Bash history successfully"
            echo -e "\n######################### Printing current Bash history contents... #########################\n"
            command cat "$HOME"/.bash_history
        
        elif [ "$user_reply" == "N" ] || [ "$user_reply" == "n" ] || [ "$user_reply" == "No" ] || [ "$user_reply" == "no" ]
            then
            echo -e "\nOkay clear bash history canceled"
        else
            echo "Invalid input"
        fi
    elif [ "$user_input" == 5 ]
        then
        echo "Ending program..."
        break
    else
        echo -e "\nInvalid selection, please try again!" #Catches any invalid input
    fi
    
done

}

clear_logs

# Note: to completely remove a log from disk sector and replace with 1s and 0s to make it harder to recover data, we should use "shred"
# shred example: -vfzu auth.log / kern.log

