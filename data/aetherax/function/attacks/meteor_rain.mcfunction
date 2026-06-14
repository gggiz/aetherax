# ==========================================
# Aetherax - Meteor Rain (Phase 3)
# 15 meteors at random positions within 30 blocks of boss
# ==========================================

# Thunderous warning
playsound minecraft:entity.lightning_bolt.thunder hostile @a[distance=..60] ~ ~ ~ 2.0 0.3

# Spawn 15 invisible markers at boss position
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}
execute at @e[tag=aetherax_boss,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_meteor_marker"]}

# Randomly spread markers within 28 blocks of boss (min 5 blocks away)
execute at @e[tag=aetherax_boss,limit=1] run spreadplayers ~ ~ 5 28 false @e[tag=aetherax_meteor_marker]

# Summon falling magma blocks at each marker (from 15 blocks above)
execute as @e[tag=aetherax_meteor_marker] at @s anchored eyes positioned ~ ~15 ~ run summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"}}

# Warning particle beams at each marker
execute at @e[tag=aetherax_meteor_marker] run particle minecraft:electric_spark ~ ~15 ~ 0.3 0.1 0.3 0.02 10 force

# Start detonation timer (40 ticks = 2s)
scoreboard players set #meteor_timer aetherax_timer 40
