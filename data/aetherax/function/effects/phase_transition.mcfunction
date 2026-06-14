# Aetherax - Phase Transition

# Prevent overlapping
execute if data storage aetherax:state {phase_transitioning:true} run return fail
data modify storage aetherax:state phase_transitioning set value true

# Freeze boss
effect give @s minecraft:slowness 2 255 true

# Shockwave VFX
particle minecraft:dragon_breath ~ ~1 ~ 3 3 3 0 200 force
particle minecraft:explosion_emitter ~ ~1 ~ 0.5 1 0.5 0 15 force

# Phase 3 message
execute if score #next_phase aetherax_timer matches 3 run title @a[distance=..60] title {"text":"","color":"gold"}
execute if score #next_phase aetherax_timer matches 3 run title @a[distance=..60] subtitle {"text":"最后一颗水晶碎裂... 现实开始崩塌！","color":"gold","italic":true}
execute if score #next_phase aetherax_timer matches 3 run playsound minecraft:entity.wither.spawn hostile @a[distance=..80] ~ ~ ~ 2.0 0.5

# Phase 2 message
execute if score #next_phase aetherax_timer matches 2 run title @a[distance=..60] subtitle {"text":"一颗虚空水晶碎裂... 战斗愈发激烈！","color":"light_purple","italic":true}
execute if score #next_phase aetherax_timer matches 2 run playsound minecraft:entity.wither.break_block hostile @a[distance=..80] ~ ~ ~ 2.0 0.5

# Lightning strikes (7 random within 30 blocks)
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_lightning"]}
execute at @s run spreadplayers ~ ~ 5 28 false @e[tag=aetherax_lightning,distance=..1]
execute at @e[tag=aetherax_lightning] run summon minecraft:lightning_bolt ~ ~ ~
kill @e[tag=aetherax_lightning]

# Darken screen
effect give @a[distance=..50] minecraft:darkness 3 0 true

# Bossbar color
execute if score #next_phase aetherax_timer matches 2 run bossbar set aetherax_health color red
execute if score #next_phase aetherax_timer matches 3 run bossbar set aetherax_health color yellow

# Resume AI after delay
scoreboard players set #phase_resume aetherax_timer 30
