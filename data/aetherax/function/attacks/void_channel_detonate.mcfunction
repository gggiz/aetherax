# Void Channel - DETONATED!

# Thunderous sound
execute as @e[tag=aetherax_boss,limit=1] at @s run playsound minecraft:entity.lightning_bolt.thunder hostile @a[distance=..60] ~ ~ ~ 2.0 0.2
execute as @e[tag=aetherax_boss,limit=1] at @s run playsound minecraft:entity.ender_dragon.death hostile @a[distance=..60] ~ ~ ~ 2.0 0.3
execute as @e[tag=aetherax_boss,limit=1] at @s run playsound minecraft:entity.generic.explode hostile @a[distance=..60] ~ ~ ~ 2.0 1.0

# Core explosion
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:explosion_emitter ~ ~ ~ 5 5 5 0.5 10 force
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:explosion_emitter ~ ~1 ~ 3 3 3 0.3 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:dragon_breath ~ ~ ~ 8 8 8 0.1 400 force

# Expanding shockwave rings (layered radii for fake expansion)
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:electric_spark ~ ~1 ~ 5 1 5 0.5 200 force
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:electric_spark ~ ~1 ~ 10 2 10 0.3 300 force
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:end_rod ~ ~1 ~ 12 3 12 0.1 200 force
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:portal ~ ~1 ~ 15 5 15 0.05 500 force

# Floor-level ring
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:dragon_breath ~ ~0.2 ~ 10 0 10 0.5 300 force

# Massive damage to all entities within 15 blocks (except boss)
execute as @e[tag=aetherax_boss,limit=1] at @s as @e[distance=..15,tag=!aetherax_boss] run damage @s 30 minecraft:magic

# Debuffs to players
execute as @e[tag=aetherax_boss,limit=1] at @s run effect give @a[distance=..15] minecraft:nausea 8 3 true
execute as @e[tag=aetherax_boss,limit=1] at @s run effect give @a[distance=..15] minecraft:wither 6 2 true
execute as @e[tag=aetherax_boss,limit=1] at @s run effect give @a[distance=..15] minecraft:darkness 3 0 true

# Cleanup
kill @e[tag=aetherax_anchor]
execute as @e[tag=aetherax_channeling,limit=1] run data merge entity @s {Invulnerable:0b}
execute as @e[tag=aetherax_channeling,limit=1] run tag @s remove aetherax_channeling

# Title
execute as @e[tag=aetherax_boss,limit=1] at @s run title @a[distance=..60] title {"text":"","color":"dark_purple"}
execute as @e[tag=aetherax_boss,limit=1] at @s run title @a[distance=..60] subtitle {"text":"虚空吞噬一切...","color":"dark_purple","bold":true}

scoreboard players set #channel_timer aetherax_timer -1
