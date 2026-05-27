#!/bin/bash

# Regular colours
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'

# Extra colours
PINK='\033[1;95m'
BROWN='\033[0;33m'   # terminals fake brown using dark yellow/orange

# Reset colour
NC='\033[0m'

shop() {

	echo -e "${RED}===================${NC}"
	echo -e "${CYAN}The Shop...${NC}"
	echo -e "${RED}===================${NC}"
	echo 
	echo
	printf "What do you want to do"


	echo -e "${YELLOW}[1]  Buy $item1${NC}" 
	echo -e "${GREEN}[2]  Buy $item2${NC}"
	echo -e "${BLUE}[4]  Buy $item3${NC}"
	echo -e "${PINK}[4]  Buy $item4${NC}"
	echo -e "${RED}[5]  EXIT SHOP${NC}"
	read shop_action

	



item1=placeholder_item  # work on this later



}