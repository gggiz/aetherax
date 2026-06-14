# Test: Void Lance (虚空光矛)
tellraw @a {"text":"[测试] 虚空光矛 (Void Lance)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/void_lance
tellraw @a {"text":"→ 观察: 0.5秒后射线射出，是否朝你飞来","color":"gray"}
tellraw @a {"text":"→ 等射线结束后运行 /function aetherax:test/check","color":"gray"}
