# Test: Rift Barrage (裂隙弹幕)
tellraw @a {"text":"[测试] 裂隙弹幕 (Rift Barrage)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/rift_barrage
tellraw @a {"text":"→ 观察: 场地是否出现裂隙，2秒后爆炸","color":"gray"}
tellraw @a {"text":"→ 等3秒后运行 /function aetherax:test/check 检查有无残留","color":"gray"}
