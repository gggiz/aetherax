# Test: Void Slash (虚空斩)
tellraw @a {"text":"[测试] 虚空斩 (Void Slash)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/void_slash
tellraw @a {"text":"→ 观察: 是否传送到你身后并攻击","color":"gray"}
tellraw @a {"text":"→ 运行 /function aetherax:test/check 检查实体","color":"gray"}
