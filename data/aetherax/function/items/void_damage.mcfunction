# Void magic damage: 5 HP bypasses armor + invincibility frames
# @s = target entity

# Read current health (scaled *100 for precision)
execute store result score #tmp_hp aetherax_vars run data get entity @s Health 100

# Subtract 5 HP (500 in scaled score)
scoreboard players remove #tmp_hp aetherax_vars 500

# If would die, leave at 0.02 HP, clear frames, then kill with sonic_boom
execute if score #tmp_hp aetherax_vars matches ..0 run data modify entity @s Health set value 0.02f
execute if score #tmp_hp aetherax_vars matches ..0 run data modify entity @s HurtTime set value 0s
execute if score #tmp_hp aetherax_vars matches ..0 run damage @s 2 minecraft:sonic_boom

# If still alive, set reduced health directly (bypasses armor + frames)
execute if score #tmp_hp aetherax_vars matches 1.. store result entity @s Health double 0.01 run scoreboard players get #tmp_hp aetherax_vars
