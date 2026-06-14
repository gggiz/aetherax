# Test: Wisp Swarm (魂火群)
tellraw @a {"text":"[测试] 魂火群 (Wisp Swarm)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/wisp_swarm
tellraw @a {"text":"→ 观察: 周围是否出现6只隐形魂火(发光轮廓)","color":"gray"}
tellraw @a {"text":"→ 运行 /function aetherax:test/check 查看魂火数量","color":"gray"}
