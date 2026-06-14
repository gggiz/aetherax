# Position sculk block in orbit around boss
# @s = boss, at @s = boss position

# Save boss yaw, override with sculk angle
execute store result score #sculk_save_yaw aetherax_timer run data get entity @s Rotation[0]
execute store result entity @s Rotation[0] float 1 run scoreboard players get #sculk_angle aetherax_timer

# Teleport sculk to orbit position (radius 3.5, slightly below eye level)
execute at @s anchored eyes positioned ^3.5 ^-2.5 ^0 run tp @e[tag=aetherax_sculk,limit=1] ~ ~ ~

# Restore boss real yaw
execute store result entity @s Rotation[0] float 1 run scoreboard players get #sculk_save_yaw aetherax_timer
