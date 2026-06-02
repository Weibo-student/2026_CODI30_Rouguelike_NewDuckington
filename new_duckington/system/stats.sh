#!/bin/bash

[ -z "$GAME_ROOT" ] && export GAME_ROOT="$(dirname "$0")/.."

load_player_data(){
    source "$GAME_ROOT/data/player_data.sh"
}

save_player_data() {
    cat > "$GAME_ROOT/data/player_data.sh" << EOF
#!/bin/bash
 
PLAYER_NAME="$PLAYER_NAME"
PLAYER_LEVEL=$PLAYER_LEVEL
PLAYER_XP=$PLAYER_XP
PLAYER_XP_NEXT=$PLAYER_XP_NEXT
PLAYER_STAT_POINTS=$PLAYER_STAT_POINTS
PLAYER_GOLD=$PLAYER_GOLD
PLAYER_FLOOR=$PLAYER_FLOOR
 
PLAYER_HP=$PLAYER_HP
PLAYER_HP_MAX=$PLAYER_HP_MAX
PLAYER_ATK=$PLAYER_ATK
PLAYER_DEF=$PLAYER_DEF
PLAYER_NRG=$PLAYER_NRG
PLAYER_NRG_MAX=$PLAYER_NRG_MAX
PLAYER_SPD=$PLAYER_SPD
PLAYER_LCK=$PLAYER_LCK
 
PLAYER_WEAPON="$PLAYER_WEAPON"
PLAYER_ARMOR="$PLAYER_ARMOR"
PLAYER_HAT="$PLAYER_HAT"
 
PLAYER_ITEMS="$PLAYER_ITEMS"
PLAYER_SKILL_CARDS="$PLAYER_SKILL_CARDS"
EOF
}

source "$GAME_ROOT/data/enemy_data.sh"

progreSh() {
    # Source: https://github.com/extensionsapp/progre.sh
    LR='\033[1;31m'
    LG='\033[1;32m'
    LY='\033[1;33m'
    LC='\033[1;36m'
    LW='\033[1;37m'
    NC='\033[0m'
    if [ "${1}" = "0" ]; then TME=$(date +"%s"); fi
    SEC=`printf "%04d\n" $(($(date +"%s")-${TME}))`; SEC="$SEC sec"
    PRC=`printf "%.0f" ${1}`
    SHW=`printf "%3d\n" ${PRC}`
    LNE=`printf "%.0f" $((${PRC}/2))`
    LRR=`printf "%.0f" $((${PRC}/2-12))`; if [ ${LRR} -le 0 ]; then LRR=0; fi;
    LYY=`printf "%.0f" $((${PRC}/2-24))`; if [ ${LYY} -le 0 ]; then LYY=0; fi;
    LCC=`printf "%.0f" $((${PRC}/2-36))`; if [ ${LCC} -le 0 ]; then LCC=0; fi;
    LGG=`printf "%.0f" $((${PRC}/2-48))`; if [ ${LGG} -le 0 ]; then LGG=0; fi;
    LRR_=""
    LYY_=""
    LCC_=""
    LGG_=""
    for ((i=1;i<=13;i++))
    do
    	DOTS=""; for ((ii=${i};ii<13;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRR_="${LRR_}#"; else LRR_="${LRR_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${DOTS}${LY}............${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 1 ]; then sleep .05; fi
    done
    for ((i=14;i<=25;i++))
    do
    	DOTS=""; for ((ii=${i};ii<25;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LYY_="${LYY_}#"; else LYY_="${LYY_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${DOTS}${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 14 ]; then sleep .05; fi
    done
    for ((i=26;i<=37;i++))
    do
    	DOTS=""; for ((ii=${i};ii<37;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LCC_="${LCC_}#"; else LCC_="${LCC_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${DOTS}${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 26 ]; then sleep .05; fi
    done
    for ((i=38;i<=49;i++))
    do
    	DOTS=""; for ((ii=${i};ii<49;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LGG_="${LGG_}#"; else LGG_="${LGG_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${LG}${LGG_}${DOTS} ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 38 ]; then sleep .05; fi
    done
}

display_player_stats() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  STATS          ║"
    echo "╠══════════════════════════════╣"
    printf "║  LVL: %3d   XP: %5d/%-5d  ║\n" "$PLAYER_LEVEL" "$PLAYER_XP" "$PLAYER_XP_NEXT"
    printf "║  HP : %5d/%-5d            ║\n" "$PLAYER_HP" "$PLAYER_HP_MAX"
    printf "║  NRG: %5d/%-5d            ║\n" "$PLAYER_NRG" "$PLAYER_NRG_MAX"
    printf "║  ATK: %3d   DEF: %3d         ║\n" "$PLAYER_ATK" "$PLAYER_DEF"
    printf "║  SPD: %3d   LCK: %3d%%        ║\n" "$PLAYER_SPD" "$PLAYER_LCK"
    echo "╚══════════════════════════════╝"
    # Health bar using progreSh
    local hp_percentage=$(( PLAYER_HP * 100 / PLAYER_HP_MAX ))
    echo "HP: $PLAYER_HP / $PLAYER_HP_MAX"
    progreSh $hp_percentage
}

display_player_equipment() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  EQUIPMENT      ║"
    echo "╠══════════════════════════════╣"
    printf "║  WEAPON: %-19s ║\n" "$PLAYER_WEAPON"
    printf "║  ARMOR : %-19s ║\n" "$PLAYER_ARMOR"
    printf "║  HAT   : %-19s ║\n" "$PLAYER_HAT"
    echo "╚══════════════════════════════╝"
}

display_player_items() {
    echo "╔═══════════════════════════════════════════╗"
    echo "║              PLAYER  ITEMS                ║"
    echo "╠═══════════════════════════════════════════╣"

    if [ ${#PLAYER_ITEMS[@]} -eq 0 ]; then
        printf "║  %-40s ║\n" "None"
    fi
    
    local i=1
    for item in "${PLAYER_ITEMS[@]}"; do
        printf "║  [%2d] %-35.35s ║\n" "$i" "$item"
        ((i++))
    done

    echo "╠═══════════════════════════════════════════╣"
    echo "║  show_item <item name>                    ║"
    echo "║  use_item <item name>                     ║"
    echo "╚═══════════════════════════════════════════╝"
}

display_player_skill_cards() {
    echo "╔═══════════════════════════════════════════╗"
    echo "║            PLAYER  SKILL CARDS            ║"
    echo "╠═══════════════════════════════════════════╣"

    if [ ${#PLAYER_SKILL_CARDS[@]} -eq 0 ]; then
        printf "║  %-40s ║\n" "None"
    fi
    
    local i=1
    for item in "${PLAYER_SKILL_CARDS[@]}"; do
        printf "║  [%2d] %-35.35s ║\n" "$i" "$item"
        ((i++))
    done

    echo "╠═══════════════════════════════════════════╣"
    echo "║  show_card <card name>                    ║"
    echo "╚═══════════════════════════════════════════╝"
}

display_enemy_stats() {
    local -n enemy="$1"
    echo "╔═════════════════════════════════════════╗"
    printf "║  ENEMY: %-31s ║\n" "${enemy[name]}"
    echo "╠═════════════════════════════════════════╣"
    printf "║  HP : %5d/%-5d                       ║\n" "${enemy[hp]}" "${enemy[hp_max]}"
    printf "║  ATK: %3d   DEF: %3d                    ║\n" "${enemy[atk]}" "${enemy[def]}"
    printf "║  BASIC ATK: %-16s            ║\n" "${enemy[attack]}"
    echo "╚═════════════════════════════════════════╝"

    # Health bar using progreSh
    local hp_percentage=$(( enemy[hp] * 100 / enemy[hp_max] ))
    echo "HP: ${enemy[hp]} / ${enemy[hp_max]}"
    progreSh $hp_percentage
}

