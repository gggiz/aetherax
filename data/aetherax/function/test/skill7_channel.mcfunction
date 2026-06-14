# Test: Void Channel (虚空引导 - 终极技)
tellraw @a {"text":"[测试] 虚空引导 (Void Channel)","color":"light_purple"}
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"警告: Boss 不存在，请先召唤！","color":"red"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/void_channel
tellraw @a {"text":"→ 观察: 头顶是否出现虚空锚点，屏幕是否变暗","color":"gray"}
tellraw @a {"text":"→ 摧毁锚点或等8秒后运行 /function aetherax:test/check","color":"gray"}
