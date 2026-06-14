# ==========================================
# Aetherax - Boss Init
# Summons the boss step by step for reliability
# ==========================================

# Lightning strike at summon position
summon minecraft:lightning_bolt ~ ~ ~

# Summon basic zombie with minimal NBT
summon minecraft:zombie ~ ~ ~ {Silent:1b,PersistenceRequired:1b,CanPickUpLoot:0b,CanBreakDoors:0b,Tags:["aetherax_boss","aetherax_p1"]}

# Set base health
data merge entity @e[tag=aetherax_boss,limit=1,sort=nearest] {Health:300f}

# --- Apply all attributes ---
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:max_health base set 300
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:attack_damage base set 8
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:movement_speed base set 0.35
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:scale base set 2.5
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:knockback_resistance base set 0.8
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:armor base set 10
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:armor_toughness base set 6
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:follow_range base set 64
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run attribute @s minecraft:step_height base set 2

# --- Permanent effects ---
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run effect give @s minecraft:fire_resistance infinite 0 true
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run effect give @s minecraft:resistance infinite 1 true
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run effect give @s minecraft:regeneration infinite 0 true

# --- Equip armor using /item replace ---
# Boots: dyed leather (dark purple) with Fire Protection IV + Feather Falling IV
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run item replace entity @s armor.feet with minecraft:leather_boots[minecraft:dyed_color=0x1a001a,minecraft:enchantments={"minecraft:fire_protection":4,"minecraft:feather_falling":4},minecraft:unbreakable={},minecraft:custom_data={aetherax:1b}]

# Leggings: dyed leather (dark purple) with Protection IV
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=0x1a001a,minecraft:enchantments={"minecraft:protection":4},minecraft:unbreakable={},minecraft:custom_data={aetherax:1b}]

# Chestplate: dyed leather (dark purple) with Protection IV
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=0x1a001a,minecraft:enchantments={"minecraft:protection":4},minecraft:unbreakable={},minecraft:custom_data={aetherax:1b}]

# Helmet: player head with Fire Protection IV
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run item replace entity @s armor.head with minecraft:player_head[minecraft:enchantments={"minecraft:fire_protection":4},minecraft:custom_data={aetherax:1b},minecraft:profile={name:"_KasLANna_"}]

# --- Equip weapon ---
execute as @e[tag=aetherax_boss,limit=1,sort=nearest] run item replace entity @s weapon.mainhand with minecraft:netherite_sword[minecraft:custom_data={aetherax_blade:1b},minecraft:enchantments={"minecraft:sharpness":5,"minecraft:fire_aspect":2},minecraft:unbreakable={}]

# --- Prevent equipment drops ---
data merge entity @e[tag=aetherax_boss,limit=1,sort=nearest] {HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f]}

# Store boss UUID for reference
execute as @e[tag=aetherax_boss,tag=!aetherax_dead,limit=1,sort=nearest] store result storage aetherax:boss.uuid string 1 run data get entity @s UUID

# Spawn the 3 orbital crystals
execute at @e[tag=aetherax_boss,limit=1] run function aetherax:effects/crystal_orbit

# Create the bossbar
bossbar add aetherax_health {"text":"Aetherax, the Void-Born Cataclysm","color":"dark_purple"}
bossbar set aetherax_health max 300
bossbar set aetherax_health value 300
bossbar set aetherax_health players @a[distance=..80]
bossbar set aetherax_health style progress

# Mark boss as active
data modify storage aetherax:boss active set value true
data modify storage aetherax:boss phase set value 1

# Final title announcement
title @a[distance=..50] title {"text":"AETHErax","color":"dark_purple","bold":true}
title @a[distance=..50] subtitle {"text":"The Void-Born Cataclysm","color":"light_purple"}
playsound minecraft:entity.ender_dragon.growl master @a[distance:..80] ~ ~ ~ 2.0 0.3

# Start ambient effects
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:effects/ambient_particles
