# Diagnostic: step by step rift barrage test
tellraw @a {"text":"=== 裂隙诊断开始 ===","color":"gold"}

# Step 1: Can we play a sound?
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0
tellraw @a {"text":"Step1: 播放声音 - OK","color":"green"}

# Step 2: Does boss exist?
execute if entity @e[tag=aetherax_boss] run tellraw @a {"text":"Step2: Boss存在","color":"green"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"Step2: Boss不存在！请先召唤","color":"red"}

# Step 3: Is there a player within 30 blocks of boss?
execute as @e[tag=aetherax_boss,limit=1] at @s if entity @a[distance=..30] run tellraw @a {"text":"Step3: 30格内有玩家","color":"green"}
execute as @e[tag=aetherax_boss,limit=1] at @s unless entity @a[distance=..30] run tellraw @a {"text":"Step3: 30格内无玩家！靠近Boss","color":"red"}

# Step 4: Try summoning ONE armor stand (simplest test)
execute as @e[tag=aetherax_boss,limit=1] at @s run summon minecraft:armor_stand ~ ~1 ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["aetherax_test"]}
execute if entity @e[tag=aetherax_test] run tellraw @a {"text":"Step4: 盔甲架召唤成功","color":"green"}
execute unless entity @e[tag=aetherax_test] run tellraw @a {"text":"Step4: 盔甲架召唤失败！NBT可能有问题","color":"red"}

# Step 5: Try tagging after summon
summon minecraft:armor_stand ~ ~2 ~ {Invisible:1b,Marker:1b,NoGravity:1b}
tag @e[type=minecraft:armor_stand,tag=!aetherax_test2,distance=..3,limit=1,sort=nearest] add aetherax_test2
execute if entity @e[tag=aetherax_test2] run tellraw @a {"text":"Step5: tag命令打标签成功","color":"green"}
execute unless entity @e[tag=aetherax_test2] run tellraw @a {"text":"Step5: tag命令打标签失败！","color":"red"}

# Step 6: Try scoreboard on fake player
scoreboard players set #rift_test aetherax_timer 40
execute if score #rift_test aetherax_timer matches 40 run tellraw @a {"text":"Step6: 假玩家计分板 - OK","color":"green"}
execute unless score #rift_test aetherax_timer matches 40 run tellraw @a {"text":"Step6: 假玩家计分板 - 失败！","color":"red"}

# Cleanup test entities
kill @e[tag=aetherax_test]
kill @e[tag=aetherax_test2]

tellraw @a {"text":"=== 诊断结束 ===","color":"gold"}
