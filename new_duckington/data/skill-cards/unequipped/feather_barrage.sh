#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/data/player_data.sh"

#Skill Properties
skill_name='Feather barrage'
skill_description='Shoot a barrage of feathers to your opponent'
rarity='rare'
damage=20
energy_cost=10

enemy_health=15 #This is a placeholder variable - update as game further develops
energy_difference=$(($PLAYER_NRG - $energy_cost))

if (( $(( $energy_difference ))  >= 0 )); then #Verify if player has sufficient energy to perform this skill.
	enemy_health=$(( $enemy_health - $damage ))
	echo "$skill_name deals $damage damage!"
	if [ $enemy_health == 0 ]; then
		echo "You have slain your enemy!"
	fi
	sed -i "s/^PLAYER_NRG=.*/PLAYER_NRG=$energy_difference/" "$GAME_ROOT/data/player_data.sh" #Update player's energy level with the difference from the cost.
else
	echo "You do not have enough energy for this action! (Current energy level: $PLAYER_NRG)"