# ==========================================
# Aetherax - Meteor Impact
# Runs as a specific meteor from tick detection (as @e[tag=aetherax_meteor])
# ==========================================

# Particles at this meteor's position
execute at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle minecraft:lava ~ ~ ~ 0.5 0.5 0.5 0.05 10
execute at @s run playsound minecraft:entity.generic.explode hostile @a[distance=..40] ~ ~ ~ 1.0 0.6

# Damage nearby players
execute at @s as @p[distance=..3] run damage @s 12 minecraft:explosion

# Set fire on the ground
execute at @s run setblock ~ ~ ~ minecraft:fire destroy

# Remove only this meteor
kill @s
