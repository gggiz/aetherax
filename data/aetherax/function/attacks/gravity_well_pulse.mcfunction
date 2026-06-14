# ==========================================
# Aetherax - Gravity Well Pulse
# Per-tick pull effect, called from tick.mcfunction while gw_timer > 0
# ==========================================

# Pull each enemy toward the boss position
execute as @e[tag=aetherax_boss,tag=aetherax_gravity_well,limit=1] at @s as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..20] at @s facing entity @e[tag=aetherax_boss,tag=aetherax_gravity_well,limit=1] eyes run tp @s ^ ^ ^0.8

# Give levitation to make them float
execute as @e[tag=aetherax_boss,tag=aetherax_gravity_well,limit=1] at @s run effect give @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..20] minecraft:levitation 1 1 true
execute as @e[tag=aetherax_boss,tag=aetherax_gravity_well,limit=1] at @s run effect give @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..20] minecraft:slowness 3 4 true

# Spiral particles
execute as @e[tag=aetherax_boss,tag=aetherax_gravity_well,limit=1] at @s run particle minecraft:portal ~ ~ ~ 3 2 3 0.05 10 force
