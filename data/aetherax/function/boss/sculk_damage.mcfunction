# Sculk aura: 3-tick escalating cycle bypasses equal-damage immunity
# @s = target entity
execute if score #sculk_cycle aetherax_timer matches 0 run damage @s 5 minecraft:magic
execute if score #sculk_cycle aetherax_timer matches 1 run damage @s 7 minecraft:sonic_boom
execute if score #sculk_cycle aetherax_timer matches 2 run damage @s 9 minecraft:magic
