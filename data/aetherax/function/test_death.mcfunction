# 诊断命令 - boss死亡后依次执行
# 先杀掉boss，然后跑这个测试

# 1. boss存不存在？
execute unless entity @e[tag=aetherax_boss] run tellraw @a {"text":"1. Boss实体已消失","color":"green"}
execute if entity @e[tag=aetherax_boss] run tellraw @a {"text":"1. Boss实体还在","color":"red"}

# 2. storage active是什么？
execute if data storage aetherax:boss {active:true} run tellraw @a {"text":"2. storage active = true","color":"green"}
execute unless data storage aetherax:boss {active:true} run tellraw @a {"text":"2. storage active = false","color":"red"}

# 3. 嵌套条件（unless entity + if data）能匹配吗？
execute unless entity @e[tag=aetherax_boss] run execute if data storage aetherax:boss {active:true} run tellraw @a {"text":"3. 嵌套检测: 两者都满足","color":"gold"}

# 4. 组合条件（unless entity + if data同一行）能匹配吗？
execute unless entity @e[tag=aetherax_boss] if data storage aetherax:boss {active:true} run tellraw @a {"text":"4. 组合检测: 两者都满足","color":"gold"}

# 5. 直接移除bossbar
bossbar remove aetherax_health

# 6. 确认bossbar已移除
tellraw @a {"text":"5. 已执行bossbar remove","color":"green"}
