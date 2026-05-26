#!/bin/bash


generate_random_room() {
	room_size=("small" "normal" "Huge")

# i want to list the 3 types of rooms and 

		selected_room=${room_size[$RANDOM % 3]}
# i think this picks between the 3 different options
		echo "you entered a $selected_room room"
	# i need to make the room show what is in it so 

		if [ "$selected_room" = "small" ]; then
			echo "you enter the shmall room"

		elif [ "$selected_room" = "normal" ]; then
			echo "you entered a normal room "

		elif [ "$selected_room" = "Huge" ]; then
			echo "YOU ARE COOKED, YOU ENTERED THE HUGE ROOM"

		fi	
}

greet_user



# now need to generate 10 different rooms and put it in an order,

# need to use shuf -e command

shuf -e small normal Huge small normal small normal Huge Huge


