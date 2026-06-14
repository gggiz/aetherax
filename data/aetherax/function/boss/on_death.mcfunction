# Aetherax - On Death reward (triggered by advancement)
# @s = the player who earned the advancement

experience add @s 12500 points
loot give @s loot aetherax:boss/aetherax
give @s minecraft:enchanted_book[minecraft:stored_enchantments={"minecraft:sharpness":6,"minecraft:unbreaking":3}]
