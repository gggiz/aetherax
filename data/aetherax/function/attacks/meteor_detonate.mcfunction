# ==========================================
# Aetherax - Meteor Detonate
# Explosion at each meteor impact point
# ==========================================

# Impact at each marker position
execute at @e[tag=aetherax_meteor_marker] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @e[tag=aetherax_meteor_marker] run particle minecraft:dragon_breath ~ ~1 ~ 0.5 0.5 0.5 0.05 10 force
execute at @e[tag=aetherax_meteor_marker] run particle minecraft:lava ~ ~ ~ 0.3 0.3 0.3 0.05 5
execute at @e[tag=aetherax_meteor_marker] run playsound minecraft:entity.generic.explode hostile @a[distance=..40] ~ ~ ~ 0.5 0.4

# Damage entities within 3 blocks of each impact (except boss and wisps)
execute at @e[tag=aetherax_meteor_marker] as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..3] run damage @s 12 minecraft:explosion

# Set fire at each impact point
execute at @e[tag=aetherax_meteor_marker] run setblock ~ ~ ~ minecraft:fire destroy

# Cleanup
kill @e[tag=aetherax_meteor_marker]

# Schedule magma block cleanup (50 ticks = 2.5s)
scoreboard players set #meteor_cleanup aetherax_timer 50
