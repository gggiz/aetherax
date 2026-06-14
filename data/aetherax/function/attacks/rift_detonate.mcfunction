# ==========================================
# Aetherax - Rift Detonate
# Detonates all pending rifts
# ==========================================


# Effects at each pending rift
execute at @e[tag=aetherax_pending] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @e[tag=aetherax_pending] run particle minecraft:dragon_breath ~ ~ ~ 1 1 1 0 30 force
execute at @e[tag=aetherax_pending] run playsound minecraft:entity.generic.explode master @a[distance=..40] ~ ~ ~ 1.0 0.8

# Damage nearby entities
execute at @e[tag=aetherax_pending] as @e[distance=..4,tag=!aetherax_boss,tag=!aetherax_pending] run damage @s 10 minecraft:explosion

# Cleanup
kill @e[tag=aetherax_pending]

# Reset timer to idle
scoreboard players set #rift_delay aetherax_timer -1
