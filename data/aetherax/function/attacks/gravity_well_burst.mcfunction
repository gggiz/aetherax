# ==========================================
# Aetherax - Gravity Well Burst
# Final implosion burst damage
# ==========================================

# Massive implosion
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:explosion_emitter ~ ~ ~ 2 2 2 0 1 force
execute as @e[tag=aetherax_boss,limit=1] at @s run playsound minecraft:entity.generic.explode hostile @a[distance=..40] ~ ~ ~ 2.0 0.3

# Burst damage to nearby enemies
execute as @e[tag=aetherax_boss,limit=1] at @s as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..3] run damage @s 24 minecraft:magic

# Knockback
execute as @e[tag=aetherax_boss,limit=1] at @s as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..5] at @s facing entity @e[tag=aetherax_boss,limit=1] run tp @s ^ ^ ^-4

# Note: tag removal and timer reset handled by tick.mcfunction
