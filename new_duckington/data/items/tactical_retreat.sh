#!/bin/bash

# import what you need here, for example:
# source new_duckington/main.sh
# source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Tactical Retreat" # Name of the item that will be displayed by the game
ITEM_TYPE="Skill Card" # Type of the item, which can be "Consumable", "Junk", "Skill Card", "Book"
ITEM_DESC="You live to fight another day"
item_effect() {
    # You learn the "Tactical Retreat" skill card, which allows you to escape from a battle without taking damage.
    echo "You used $ITEM_NAME and learned the Tactical Retreat skill card!"
    # More skill card logic...
}
ITEM_RARITY="Rare" # Rarity of the item, which can be "Common", "Uncommon", "Rare", "Epic", "Legendary"
ITEM_NUMBER=011 # Unique identifier for the item
ITEM_COST=0
ITEM_SELL=800 # Sell price of the item in the shop, if it's a shop item. You can set it to 0 if it's unsellable.