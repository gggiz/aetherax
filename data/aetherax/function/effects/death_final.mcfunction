# Aetherax - Final death explosion (3 seconds after death)
# Positioned at death anchor

# Cataclysmic void explosion
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:explosion_emitter ~ ~ ~ 5 6 5 0.1 50 force
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dragon_breath ~ ~ ~ 10 10 10 0 300 force
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dust{color:[0.4,0.0,0.7],scale:3.0} ~ ~ ~ 7 7 7 0 150 force
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:portal ~ ~ ~ 8 8 8 0.1 120 force

# Final sounds
execute at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:entity.generic.explode hostile @a[distance=..80] ~ ~ ~ 2.0 0.3
execute at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:block.end_portal.spawn hostile @a[distance=..80] ~ ~ ~ 2.0 1.5

# Lightning barrage
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~3 ~ ~
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~-3 ~ ~
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~ ~ ~3
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~ ~ ~-3

# Kill anchor
kill @e[tag=aetherax_death_anchor]

# Victory
title @a title {"text":"胜利！","color":"gold","bold":true}
title @a subtitle {"text":"艾瑟拉克斯已被击败","color":"green"}
scoreboard players set #death_reward aetherax_timer 3
scoreboard players set #boss_state aetherax_vars 0
data modify storage aetherax:boss active set value false
