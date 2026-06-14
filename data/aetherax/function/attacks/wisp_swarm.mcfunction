# Wisp Swarm - summon 6 wisps (vex) around the boss
playsound minecraft:entity.evoker.prepare_summon hostile @a[distance=..50] ~ ~ ~ 1.5 0.5

# Summon 6 bare vexes with tags (apply effects/attributes after)
summon minecraft:vex ~3.5 ~1 ~2 {Silent:1b,Tags:["aetherax_wisp"]}
summon minecraft:vex ~-3.5 ~1 ~2 {Silent:1b,Tags:["aetherax_wisp"]}
summon minecraft:vex ~0 ~1 ~3.5 {Silent:1b,Tags:["aetherax_wisp"]}
summon minecraft:vex ~0 ~1 ~-3.5 {Silent:1b,Tags:["aetherax_wisp"]}
summon minecraft:vex ~2.5 ~1 ~-2.5 {Silent:1b,Tags:["aetherax_wisp"]}
summon minecraft:vex ~-2.5 ~1 ~-2.5 {Silent:1b,Tags:["aetherax_wisp"]}

# Apply effects to all wisps (glowing outline + invisibility for ghost effect)
effect give @e[tag=aetherax_wisp] minecraft:glowing 999999 0 true
effect give @e[tag=aetherax_wisp] minecraft:invisibility 999999 0 true

# Set attributes for all wisps
execute as @e[tag=aetherax_wisp] run attribute @s minecraft:max_health base set 20
execute as @e[tag=aetherax_wisp] run attribute @s minecraft:attack_damage base set 6
execute as @e[tag=aetherax_wisp] run attribute @s minecraft:follow_range base set 32
execute as @e[tag=aetherax_wisp] run attribute @s minecraft:scale base set 0.7
