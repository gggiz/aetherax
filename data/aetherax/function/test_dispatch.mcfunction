# Test combined conditions with nested execute
execute if entity @s[tag=aetherax_p1] run execute if score #testroll aetherax_timer matches 40..99 run tellraw @a {"text":"Nested check WORKS - 40..99 range matched","color":"gold"}

# Also test the other range
execute if entity @s[tag=aetherax_p1] run execute if score #testroll aetherax_timer matches 0..39 run tellraw @a {"text":"Nested check WORKS - 0..39 range matched","color":"gold"}

tellraw @a {"text":"Test complete. Check which range matched.","color":"white"}
