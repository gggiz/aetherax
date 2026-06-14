# ==========================================
# Aetherax - Void Lance (Ray Step)
# Moves the lance marker forward, does damage, checks collision
# NOTE: Runs via schedule (world spawn) — uses @e global selectors
# ==========================================

# Increment step counter
scoreboard players add #lance_step aetherax_timer 1

# Move marker forward 0.5 blocks
execute as @e[tag=aetherax_lance,limit=1] at @s run tp @s ^ ^ ^0.5

# Particles and damage at marker position
execute at @e[tag=aetherax_lance,limit=1] run particle minecraft:sonic_boom ~ ~ ~ 0.1 0.1 0.1 0.01 3 force
execute at @e[tag=aetherax_lance,limit=1] run particle minecraft:dust{color:[0.3,0.0,0.5],scale:2.0} ~ ~ ~ 0.2 0.2 0.2 0 5 force
execute at @e[tag=aetherax_lance,limit=1] run damage @p[distance=..1.5] 14 minecraft:sonic_boom at @s by @e[tag=aetherax_boss,limit=1]

# Check for wall collision or max range
execute at @e[tag=aetherax_lance,limit=1] if block ~ ~ ~ minecraft:obsidian run scoreboard players set #lance_step aetherax_timer 26
execute at @e[tag=aetherax_lance,limit=1] if block ~ ~ ~ minecraft:bedrock run scoreboard players set #lance_step aetherax_timer 26

# Continue or burst
execute if score #lance_step aetherax_timer matches ..25 run schedule function aetherax:attacks/void_lance_fire 0.05s

# At max range: final burst
execute at @e[tag=aetherax_lance,limit=1] if score #lance_step aetherax_timer matches 26 run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @e[tag=aetherax_lance,limit=1] if score #lance_step aetherax_timer matches 26 run playsound minecraft:entity.generic.explode hostile @a[distance=..40] ~ ~ ~ 1.0 1.5
execute if score #lance_step aetherax_timer matches 26 run kill @e[tag=aetherax_lance]
execute if score #lance_step aetherax_timer matches 26 run scoreboard players set #lance_step aetherax_timer 0
