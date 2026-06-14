# Aetherax - Sculk block orbit + void aura (rage mode)
# Runs from tick while aetherax_sculk entity exists

# --- Update sculk orbit angle ---
scoreboard players add #sculk_angle aetherax_timer 5
execute if score #sculk_angle aetherax_timer matches 360.. run scoreboard players set #sculk_angle aetherax_timer 0

# --- Position sculk around boss ---
execute as @e[tag=aetherax_boss,tag=!aetherax_dead,limit=1] at @s run function aetherax:boss/sculk_position

# --- Ambient particles at sculk ---
execute at @e[tag=aetherax_sculk,limit=1] run particle minecraft:dust{color:[0.05,0.05,0.15],scale:2.0} ~ ~ ~ 0.5 0.5 0.5 0 5

# --- Void aura: 3-tick escalating cycle (3→4→5) to bypass immunity ---
scoreboard players add #sculk_cycle aetherax_timer 1
execute if score #sculk_cycle aetherax_timer matches 3.. run scoreboard players set #sculk_cycle aetherax_timer 0
execute at @e[tag=aetherax_sculk,limit=1] as @e[distance=..5,type=!minecraft:item,type=!minecraft:experience_orb,tag=!aetherax_boss,tag=!aetherax_sculk,tag=!aetherax_crystal,tag=!aetherax_wisp,tag=!aetherax_death_anchor] run function aetherax:boss/sculk_damage

# --- Kill arrows near sculk ---
execute at @e[tag=aetherax_sculk,limit=1] run kill @e[type=minecraft:arrow,distance=..5]
