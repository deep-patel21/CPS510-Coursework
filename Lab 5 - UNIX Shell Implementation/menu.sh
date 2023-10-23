
#!/bin/sh
Pause() {
        read -p "Press any key to continue..."
}

MainMenu()
{
        while [ "$CHOICE" != "START" ]
        do
                clear
                echo
                "================================================================="
                echo "| Oracle All Inclusive Tool
                |"
                echo "| Main Menu - Select Desired Operation(s):
                |"
                echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
                |"
                echo "-------------------------------------------------------------
                ----"
                echo " $IS_SELECTEDM M) View Manual"
                echo " "
                echo " $IS_SELECTED1 1) Drop Tables"
                echo " $IS_SELECTED2 2) Drop Views"
                echo " $IS_SELECTED3 3) Create Tables"
                echo " $IS_SELECTED2 4) Create Views"
                echo " $IS_SELECTED3 5) Populate Tables"
                echo " $IS_SELECTED4 6) Query Tables"
                echo " "
                echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
                echo " "
                echo " $IS_SELECTEDE E) End/Exit"
                echo "Choose: "
                read CHOICE
                if [ "$CHOICE" == "0" ]
                then
                        echo "Nothing Here"
                elif [ "$CHOICE" == "1" ]
                then
                        bash drop_tables.sh
                        Pause
                elif [ "$CHOICE" == "2" ]
                then
                        bash drop_views.sh
                        Pause
                elif [ "$CHOICE" == "3" ]
                then
                        bash create_tables.sh
                        Pause
                elif [ "$CHOICE" == "4" ]
                then
                        bash create_views.sh
                        Pause
                elif [ "$CHOICE" == "5" ]
                then
                        bash populate_tables.sh
                        Pause
                elif [ "$CHOICE" == "6" ]
                then
                        bash queries.sh
                        Pause
                elif [ "$CHOICE" == "E" ]
                then
                        exit
                fi
        done
}
#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
        StartMessage
        while [ 1 ]
        do
                MainMenu
        done
}
ProgramStart
