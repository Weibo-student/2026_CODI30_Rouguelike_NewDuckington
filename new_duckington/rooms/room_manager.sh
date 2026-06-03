#!/bin/bash
export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/data/enemy_data.sh"
combat_rooms=("small" "normal" "huge" "shop" "event")
declare -a room_list

#temp_rooms+=("shop")
#temp_rooms+=("event")

generate_random_room() {
	# i want to list the 3 types of rooms and also have guaranteed rooms

	selected_room=${combat_rooms[$((RANDOM % ${#combat_rooms[@]}))]}
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

declare -a floor_1
declare -a floor_2
declare -a floor_3
declare -a floor_4
declare -a floor_5
declare -a floor_6
declare -a floor_7
declare -a floor_8
declare -a floor_9
declare -a floor_10


initialize_rooms >> floor_1.txt
initialize_rooms >> floor_2.txt
initialize_rooms >> floor_3.txt
initialize_rooms >> floor_4.txt
initialize_rooms >> floor_5.txt
initialize_rooms >> floor_6
initialize_rooms >> floor_7
initialize_rooms >> floor_8
initialize_rooms >> floor_9
initialize_rooms >> floor_10.txt

# kind of raw code right now

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
echo "You have entered the mini boss on room"

}





final_bossfight() {

echo "YOU ARE COOKED"
}