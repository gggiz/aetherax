# Sync bossbar value and player list
execute store result bossbar aetherax_health value run data get entity @e[tag=aetherax_boss,tag=!aetherax_dead,limit=1] Health

# Update visible players every 5 seconds (100 ticks)
execute if score #bb_timer aetherax_timer matches 0.. run scoreboard players remove #bb_timer aetherax_timer 1
execute if score #bb_timer aetherax_timer matches ..0 as @e[tag=aetherax_boss,tag=!aetherax_dead,limit=1] at @s run bossbar set aetherax_health players @a[distance=..80]
execute if score #bb_timer aetherax_timer matches ..0 run scoreboard players set #bb_timer aetherax_timer 100
