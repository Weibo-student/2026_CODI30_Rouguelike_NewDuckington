#!/bin/bash

source "shop_menu.sh"

small_room() {
	echo "you have entered a small room"

	for ((i=0; i<1; 1++)); do
		generate_enemy
	done
}





normal_room(){
	echo "you have entered a normal room"

	for ((i=0; i<3; 1++)); do
		generate_enemy
	done

}





huge_room(){
	echo "you have entered a massive room"

	for ((i=0; i<5; 1++)); do
		generate_enemy
	done
}


shop() {

}