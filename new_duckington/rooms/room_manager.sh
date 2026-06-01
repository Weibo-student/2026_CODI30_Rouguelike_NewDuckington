#!/bin/bash
export GAME_ROOT="$(dirname "$0")/.."
room_types=("small" "normal" "huge" "shop" "event")
declare -a room_list

generate_random_room() {
	# i want to list the 3 types of rooms and 

	selected_room=${room_types[$((RANDOM % ${#room_types[@]}))]}
	# i think this picks between the 3 different options

	room_list+=("$selected_room")
}	

initialize_rooms() {
	for ((i=0; i<10; i++)); do
		generate_random_room
	done


	shuf -e "${room_list[@]}" 1> /dev/null   #shuf sends the output nowhere because it echos for some reason
}

initialize_rooms
echo ${room_list[@]}



#=================================================================

#need to make a list of available enemies, 

declare -a ENEMY_LIST
#ls $GAME_ROOT/data/enemies/
for file in $GAME_ROOT/data/enemies/*; do
    if [[ -f "$file" ]]; then
        ENEMY_LIST+=("$(basename "$file")")
    fi
done
echo ${ENEMY_LIST[@]}
