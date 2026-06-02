#!/bin/bash
export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/data/enemy_data.sh"
combat_rooms=("small" "normal" "huge" "shop" "event")
declare -a room_list

# temp_rooms+=("shop")
#temp_rooms+=("event")

generate_random_room() {
	# i want to list the 3 types of rooms and also have guaranteed rooms

	selected_room=${combat_rooms[$((RANDOM % ${#combat_rooms[@]}))]}
	# i think this picks between the 3 different options

	room_list+=("$selected_room")
}	

initialize_rooms() {
	for ((i=0; i<20; i++)); do
		generate_random_room
	done


	shuf -e "${room_list[@]}" 1> /dev/null   #shuf sends the output nowhere because it echos for some reason
}

#initialize_rooms UNCOMMENT THIS LATER
echo ${room_list[@]}



#=================================================================

# #need to make a list of available enemies, 

# declare -a ENEMY_LIST
# #ls $GAME_ROOT/data/enemies/
# for file in $GAME_ROOT/data/enemies/*; do
# 	if [[ "$(basename "$file")" == 'ememy_example.sh' ]]; then
# 		continue
#     elif [[ -f "$file" ]]; then
#         ENEMY_LIST+=("$(basename "$file")")
#     fi
# done
# echo ${ENEMY_LIST[@]}


#=========================================
declare -a ENEMY_LIST=(
    "BEAR_GRUNT"
    "EARTH_BEAR"
    "IRON_BEAR"
    "GRIM_BEAR"
    "HOLLOW_BEAR"
    "GRIZZLED_MAULER"
    "WATER_BEAR"
    "FIRE_BEAR"
    "AIR_BEAR"
)

random_enemy=${ENEMY_LIST[$((RANDOM % ${#ENEMY_LIST[@]}))]}

echo "$random_enemy"

declare -n enemy="$random_enemy"

echo "${enemy[name]}"
echo "${enemy[hp]}"
echo "${enemy[atk]}"







#i need to setup boss_room

boss_fight(){


}





final_bossfight() {


}