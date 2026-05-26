#!/bin/bash

use_input="not set" #valid or error as needed...
choice=""

display_title(){
	echo -e "
██████╗  ██████╗   ██████╗ ██╗   ██╗ ███████╗ ██╗      ██╗ ██╗  ██╗ ███████╗
██╔══██╗██╔═══██╗ ██╔════╝ ██║   ██║ ██╔════╝ ██║      ██║ ██║ ██╔╝ ██╔════╝
██████╔╝██║   ██║ ██║  ███╗██║   ██║ █████╗   ██║      ██║ █████╔╝  █████╗  
██╔══██╗██║   ██║ ██║   ██║██║   ██║ ██╔══╝   ██║      ██║ ██╔═██╗  ██╔══╝  
██║  ██║╚██████╔╝ ╚██████╔╝╚██████╔╝ ███████╗ ███████╗ ██║ ██║  ██╗ ███████╗
╚═╝  ╚═╝ ╚═════╝   ╚═════╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚═╝ ╚═╝  ╚═╝ ╚══════╝

███╗   ██╗███████╗██╗    ██╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ████████╗ ██████╗ ███╗   ██╗
████╗  ██║██╔════╝██║    ██║██╔══██╗██║   ██║██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ╚══██╔══╝██╔═══██╗████╗  ██║
██╔██╗ ██║█████╗  ██║ █╗ ██║██║  ██║██║   ██║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗   ██║   ██║   ██║██╔██╗ ██║
██║╚██╗██║██╔══╝  ██║███╗██║██║  ██║██║   ██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║   ██║   ██║   ██║██║╚██╗██║
██║ ╚████║███████╗╚███╔███╔╝██████╔╝╚██████╔╝╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝   ██║   ╚██████╔╝██║ ╚████║
╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═══╝
"
}

display_inital_menu()
{
		echo ""
	echo "╔══════════════════════════════════════╗"
	echo "║            [1] START GAME            ║"
	echo "╠══════════════════════════════════════╣"
	echo "║          [2] SAVE PROGRESS           ║"
	echo "╠══════════════════════════════════════╣"
	echo "║            [3] LOAD GAME             ║"
	echo "╠══════════════════════════════════════╣"
	echo "║             [4] EXIT GAME            ║"
	echo "╚══════════════════════════════════════╝"

	echo ""
}

get_user_option()
{
	get_and_check_input_is_valid
	
	
	case $choice in
	    1)
	        echo "Starting game..."
	        sleep 2
	        ;;
	    2)
	        echo "Saving progress..."
	        sleep 2
	        ;;
	    3)
	        echo "Loading game..."
	        sleep 2
	        ;;
	    4)
	        echo "Goodbye!"
	        exit 0
	        ;;
	    *)
	        echo -e "Oops! Something went wrong :( \nPlease use only numbers from the menu options :D"
	        sleep 2
	        ;;
	esac
}

get_and_check_input_is_valid()
{
	read -p "ENTER CHOICE: " choice
	#use logic to test that the users input is valid for our use. Is only a single digit number for example...
}

while [[ $use_input != "valid" ]]
do
	clear
display_title
display_inital_menu
get_user_option
get_and_check_input_is_valid


	

done


