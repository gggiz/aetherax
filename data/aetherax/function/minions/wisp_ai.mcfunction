# Wisp AI - particle trail and contact damage to boss's enemies

# Particle trail
particle minecraft:soul_fire_flame ~ ~0.2 ~ 0.15 0.15 0.15 0.005 2
particle minecraft:portal ~ ~0.5 ~ 0.1 0.1 0.1 0.03 2

# Damage nearby enemies (non-boss, non-wisp within 2 blocks)
execute as @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..2,sort=nearest,limit=1] run damage @s 3 minecraft:magic
