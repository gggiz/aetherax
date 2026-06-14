# Aetherax summon - minimal working version

# Only one boss at a time
execute if entity @e[tag=aetherax_boss] run tellraw @a {"text":"艾瑟拉克斯已经存在！","color":"red"}
execute if entity @e[tag=aetherax_boss] run return fail

# Store position
execute store result storage aetherax:boss arena.x int 1 run data get entity @s Pos[0]
execute store result storage aetherax:boss arena.y int 1 run data get entity @s Pos[1]
execute store result storage aetherax:boss arena.z int 1 run data get entity @s Pos[2]

# Warning
title @a times 5 40 10
title @a title {"text":"虚空涌动...","color":"dark_purple","bold":true}
title @a subtitle {"text":"艾瑟拉克斯降临此世","color":"light_purple","italic":true}

# Sound
playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1.0 0.1
playsound minecraft:block.respawn_anchor.set_spawn hostile @a ~ ~ ~ 1.0 2.0

# Particles
particle minecraft:dragon_breath ~ ~ ~ 2 4 2 0 300 force
particle minecraft:electric_spark ~ ~ ~ 0.5 1 0.5 0.5 100 force
particle minecraft:portal ~ ~1 ~ 1.5 2 1.5 0.02 200 force

# Lightning
summon minecraft:lightning_bolt ~ ~ ~

# Summon boss - bare minimum zombie
summon minecraft:zombie ~ ~ ~ {Silent:1b,PersistenceRequired:1b,CanPickUpLoot:0b,CanBreakDoors:0b,Tags:["aetherax_boss","aetherax_p1"],Health:300f,death_loot_table:"aetherax:boss/aetherax"}

# Force-load arena chunk so boss doesn't unload when players leave/die
forceload add ~ ~

# Basic stats via attribute
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:max_health base set 300
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:attack_damage base set 8
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:scale base set 2.5
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:movement_speed base set 0.35
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:knockback_resistance base set 0.8
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:follow_range base set 64
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:step_height base set 2
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:armor base set 10
attribute @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:armor_toughness base set 6

# Ensure full HP
data merge entity @e[tag=aetherax_boss,limit=1,sort=nearest] {Health:300f}

# Equip via /item replace with components
# Boots - dark purple, Fire Prot IV + Feather Falling IV
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] armor.feet with minecraft:leather_boots[minecraft:dyed_color=0x550088,minecraft:enchantments={fire_protection:4,feather_falling:4}]
# Leggings - dark purple, Protection IV
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] armor.legs with minecraft:leather_leggings[minecraft:dyed_color=0x550088,minecraft:enchantments={protection:4}]
# Chestplate - dark purple, Protection IV
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=0x550088,minecraft:enchantments={protection:4}]
# Helmet - player head, Fire Protection IV
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] armor.head with minecraft:player_head[minecraft:enchantments={fire_protection:4},minecraft:profile={name:"_KasLANna_"}]
# Sword - Sharpness V + Fire Aspect II
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] weapon.mainhand with minecraft:netherite_sword[minecraft:enchantments={sharpness:5,fire_aspect:2}]

# Bossbar
bossbar add aetherax_health {"text":"艾瑟拉克斯 · 虚空灾变","color":"dark_purple"}
bossbar set aetherax_health max 300
bossbar set aetherax_health value 300
bossbar set aetherax_health players @a[distance=..80]
scoreboard players set #bb_timer aetherax_timer 0

# Active flag (both storage and scoreboard)
data modify storage aetherax:boss active set value true
scoreboard players set #boss_state aetherax_vars 1

# Announce
title @a title {"text":"艾瑟拉克斯","color":"dark_purple","bold":true}
title @a subtitle {"text":"虚空灾变","color":"light_purple"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 2.0 0.3

# Permanent effects
effect give @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:fire_resistance infinite 0 true
effect give @e[tag=aetherax_boss,limit=1,sort=nearest] minecraft:resistance infinite 1 true

# Mark as new boss for crystal binding
tag @e[tag=aetherax_boss,limit=1,sort=nearest] add aetherax_new

# Crystals
execute as @e[tag=aetherax_new,limit=1] at @s run function aetherax:effects/crystal_orbit
tag @e[tag=aetherax_new] remove aetherax_new

tellraw @a {"text":"艾瑟拉克斯已被召唤！","color":"green"}
