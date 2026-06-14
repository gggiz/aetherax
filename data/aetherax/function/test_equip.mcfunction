# Test various enchantment formats for 1.26.1
# Test 1: no levels wrapper, just direct
item replace entity @e[tag=aetherax_boss,limit=1,sort=nearest] weapon.mainhand with minecraft:netherite_sword[minecraft:enchantments={sharpness:5}]
tellraw @a {"text":"Test1: enchantments={sharpness:5} - check if sword has sharpness","color":"gold"}
