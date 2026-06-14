# Test: Gravity Well (重力井)
tellraw @a {"text":"[测试] 重力井 (Gravity Well)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/gravity_well
tellraw @a {"text":"→ 观察: 是否被拉向Boss，3秒后爆发伤害","color":"gray"}
tellraw @a {"text":"→ 技能结束(3秒+)后运行 /function aetherax:test/check","color":"gray"}
