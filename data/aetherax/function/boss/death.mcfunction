# Aetherax - Death trigger (called from AI when HP <= 0)
# @s = boss (about to die)

execute if score #boss_state aetherax_vars matches 0 run return fail

# Clean up minions
kill @e[tag=aetherax_wisp]
kill @e[tag=aetherax_crystal]
kill @e[tag=aetherax_sculk]

# Remove bossbar
bossbar remove aetherax_health

# Victory
title @a title {"text":"胜利！","color":"gold","bold":true}
title @a subtitle {"text":"艾瑟拉克斯已被击败","color":"green"}

# Grant rewards + cleanup
function aetherax:boss/death_reward

# Reset state
scoreboard players set #boss_state aetherax_vars 0
data modify storage aetherax:boss active set value false

# Release forceload then kill boss entity
forceload remove ~ ~
kill @s
