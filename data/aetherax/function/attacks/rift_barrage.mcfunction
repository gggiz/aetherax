# ==========================================
# Aetherax - Rift Barrage
# Spawns void rifts with visible particles, detonates after 2 seconds
# ==========================================

# Warning sound
playsound minecraft:entity.evoker.prepare_summon master @a ~ ~ ~ 1.0 0.5

# Summon invisible markers at each enemy
execute as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..30] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_rift","aetherax_pending"]}

# Giant portal pillar at each rift
execute at @e[tag=aetherax_pending] run particle minecraft:portal ~ ~ ~ 0.8 0.8 0.8 0.05 50 force
execute at @e[tag=aetherax_pending] run particle minecraft:portal ~ ~1 ~ 0.8 0.8 0.8 0.05 50 force
execute at @e[tag=aetherax_pending] run particle minecraft:portal ~ ~2 ~ 0.8 0.8 0.8 0.05 50 force
execute at @e[tag=aetherax_pending] run particle minecraft:portal ~ ~3 ~ 0.8 0.8 0.8 0.05 40 force

# Electric storm
execute at @e[tag=aetherax_pending] run particle minecraft:electric_spark ~ ~1 ~ 1 1 1 0.15 20 force
execute at @e[tag=aetherax_pending] run particle minecraft:electric_spark ~ ~2 ~ 1 1 1 0.15 15 force

# Dragon breath aura
execute at @e[tag=aetherax_pending] run particle minecraft:dragon_breath ~ ~ ~ 1 0.5 1 0.03 15 force

title @a actionbar {"text":"裂隙已布下...","color":"light_purple"}

# Start global detonation timer (40 ticks = 2 seconds)
scoreboard players set #rift_delay aetherax_timer 40
