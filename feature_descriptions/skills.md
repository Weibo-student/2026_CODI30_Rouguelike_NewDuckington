# Feature/Mechanic Document


## Overview
Skills are abilities used in combat for a more interesting move than just "attack"

## Objective / use case
Skills are meant to give some sort of advantage in combat to the user, but they also require energy to be used (to balance out the effects)

## Interactions (What uses or where it used)
Combat

## flowchart / Design
What each skill script should have:
- Variables:
    - Name
    - Effect description
    - Energy cost
    - Rarity
- Functions:
    - Activated effect OR passive effect

Skill ranking system:
- Common  (<= 5 points)
- Rare    (> 5 and <= 10)
- Epic    (> 10 and <= 15)
- Legendary (> 15)

How to determine points for a skill:
- Deal damage/heal: +0.5 points per damage dealt (or hp healed)
- Apply status effect (like fire): +2.5 points per status
- Energy cost: -1 point per energy cost
- Add up total and then assign rarity

Example Skill:
    Name: "fire punch"
    Effect description: "Punch your enemies with your fist, dealing 10 damage and applying 2 stacks of fire"
    Energy cost: 5
    Rarity: Common
    *you would code the rest here

## Modifications (current / completed / future)


## Appendix / Supporting Docs
None