# Void enchant: right-click sword or first-hit to apply
# @s = player who right-clicked / attacked with netherite sword

# Must hold netherite sword and not already a void wielder
execute unless items entity @s weapon.mainhand minecraft:netherite_sword run return fail
execute if entity @s[tag=aetherax_void_wielder] run tellraw @s [{"text":"[虚空之力] ","color":"dark_purple"},{"text":"已是虚空使者。如要更换武器，请先 /tag @s remove aetherax_void_wielder","color":"gold"}]
execute if entity @s[tag=aetherax_void_wielder] run return fail

# Try to consume template
execute store result score #tmp_clear aetherax_vars run clear @s minecraft:paper[minecraft:custom_data~{aetherax:{void_template:true}}] 1
execute if score #tmp_clear aetherax_vars matches 0 run tellraw @s [{"text":"[虚空之力] ","color":"dark_purple"},{"text":"缺少虚空之力卷轴","color":"red"}]
execute if score #tmp_clear aetherax_vars matches 0 run return fail

# Try to consume void star
execute store result score #tmp_clear aetherax_vars run clear @s minecraft:nether_star[minecraft:custom_data~{aetherax:{void_heart:true}}] 1
execute if score #tmp_clear aetherax_vars matches 0 run tellraw @s [{"text":"[虚空之力] ","color":"dark_purple"},{"text":"缺少虚空之星","color":"red"}]
execute if score #tmp_clear aetherax_vars matches 0 run return fail

# Apply void_enchant to held sword
execute if data entity @s SelectedItem.components."minecraft:custom_data" run data modify entity @s SelectedItem.components."minecraft:custom_data" merge value {aetherax:{void_enchant:true}}
execute unless data entity @s SelectedItem.components."minecraft:custom_data" run data modify entity @s SelectedItem.components."minecraft:custom_data" set value {aetherax:{void_enchant:true}}

# Add void lore
item modify entity @s weapon.mainhand aetherax:add_void_lore

# Set custom name
data modify entity @s SelectedItem.components."minecraft:custom_name" set value '{"text":"虚空之刃","color":"dark_purple","italic":false}'

# Tag player
tag @s add aetherax_void_wielder

# VFX
particle minecraft:portal ^ ^ ^1.5 0.8 0.8 0.8 0.1 80
particle minecraft:dust{color:[0.5,0.0,0.8],scale:1.5} ^ ^ ^1.5 0.5 0.5 0.5 0.05 40
playsound minecraft:block.end_portal.spawn player @s ~ ~ ~ 0.6 1.5
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1.0 0.5
tellraw @s [{"text":"[虚空之力] ","color":"dark_purple"},{"text":"虚空附魔已注入剑刃！","color":"light_purple"}]
