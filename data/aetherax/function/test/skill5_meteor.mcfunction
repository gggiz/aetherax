# Test: Meteor Rain (陨石雨)
tellraw @a {"text":"[测试] 陨石雨 (Meteor Rain)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/meteor_rain
tellraw @a {"text":"→ 观察: 头顶是否掉落岩浆块陨石","color":"gray"}
tellraw @a {"text":"→ 陨石落地后运行 /function aetherax:test/check","color":"gray"}
