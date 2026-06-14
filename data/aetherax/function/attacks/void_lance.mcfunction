# ==========================================
# Aetherax - Void Lance
# Charge at boss position, then beam toward target
# ==========================================

# Tag nearest enemy as target
tag @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..32,sort=nearest,limit=1] add aetherax_lance_target

# Charge warning
playsound minecraft:entity.warden.sonic_charge hostile @a[distance=..60] ~ ~ ~ 2.0 1.0
particle minecraft:portal ~ ~1.5 ~ 0.8 1 0.8 0.05 40 force
particle minecraft:dragon_breath ~ ~1.5 ~ 0.5 1 0.5 0.03 20 force

# Start charge timer (10 ticks = 0.5s)
scoreboard players set #lance_cd aetherax_timer 10
