# Per-boss orbital rotation - @s is the boss, at @s boss position
# Orbit angle is global, independent of boss facing

# Save boss's real yaw, then override with orbit angle
execute store result score #orb_save_yaw aetherax_timer run data get entity @s Rotation[0]
execute store result entity @s Rotation[0] float 1 run scoreboard players get #orb_angle aetherax_timer

# Crystal 1 - right side (purple trail)
execute at @s anchored eyes positioned ^3.5 ^0 ^0 run tp @e[tag=aetherax_crystal_1,distance=..6,limit=1] ~ ~ ~
execute at @e[tag=aetherax_crystal_1,distance=..6,limit=1] run particle minecraft:portal ~ ~ ~ 0 0 0 0 1

# Crystal 2 - front-left
execute at @s anchored eyes positioned ^-2 ^0 ^3 run tp @e[tag=aetherax_crystal_2,distance=..6,limit=1] ~ ~ ~
execute at @e[tag=aetherax_crystal_2,distance=..6,limit=1] run particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0 1

# Crystal 3 - left side (golden trail)
execute at @s anchored eyes positioned ^-3 ^0 ^0 run tp @e[tag=aetherax_crystal_3,distance=..6,limit=1] ~ ~ ~
execute at @e[tag=aetherax_crystal_3,distance=..6,limit=1] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1

# Restore boss's real yaw
execute store result entity @s Rotation[0] float 1 run scoreboard players get #orb_save_yaw aetherax_timer
