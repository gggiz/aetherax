# ==========================================
# Aetherax - Gravity Well (Phase 3)
# Pulls players toward boss over 3 seconds, then burst
# ==========================================

# Sound buildup
playsound minecraft:block.respawn_anchor.charge hostile @a[distance=..50] ~ ~ ~ 2.0 0.1

# Spiral particle effect pulling inward

# Debuff enemies with weakness 2 for duration + 3s
execute as @s at @s run effect give @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..20] minecraft:weakness 8 1 true

# Initiate pull sequence (3 seconds = 60 ticks, tick-based pulsing)
scoreboard players set #gw_cooldown aetherax_timer 300
scoreboard players set #gw_timer aetherax_timer 60
tag @s add aetherax_gravity_well
