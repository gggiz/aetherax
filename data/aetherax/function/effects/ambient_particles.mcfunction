# ==========================================
# Aetherax - Ambient Particle Aura
# Runs every tick while boss is alive
# ==========================================

# Void mist ring at feet

# Portal spiral rising upward
particle minecraft:portal ~ ~1.5 ~ 0.4 1.2 0.4 0.01 5

# End rod glow at eye level (face glow)
particle minecraft:end_rod ~ ~2.2 ~ 0.15 0.6 0.15 0 2

# Soul flame wisps drifting off body
particle minecraft:soul_fire_flame ~ ~1 ~ 0.6 1.5 0.6 0.002 3

# Ground corruption cracks (sculk particles)
particle minecraft:sculk_soul ~ ~0.05 ~ 1.5 0 1.5 0 3

# Phase-specific particles
execute if entity @s[tag=aetherax_p3] run particle minecraft:electric_spark ~ ~1.5 ~ 0.5 1 0.5 0.1 3
execute if entity @s[tag=aetherax_p3] run particle minecraft:soul_fire_flame ~ ~1 ~ 1 2 1 0.005 5
