# Apply speed II + conduit power II + void footstep particles
execute as @a if items entity @s armor.feet *[minecraft:custom_data~{aetherax:{voidwalker_boots:true}}] at @s run particle minecraft:portal ~ ~0.05 ~ 0.12 0 0.12 0.02 3
execute as @a if items entity @s armor.feet *[minecraft:custom_data~{aetherax:{voidwalker_boots:true}}] at @s run particle minecraft:dust{color:[0.3,0.0,0.5],scale:0.6} ~ ~0.02 ~ 0.08 0 0.08 0.01 2
execute as @a if items entity @s armor.feet *[minecraft:custom_data~{aetherax:{voidwalker_boots:true}}] run effect give @s minecraft:speed 5 1 true
execute as @a if items entity @s armor.feet *[minecraft:custom_data~{aetherax:{voidwalker_boots:true}}] run effect give @s minecraft:conduit_power 5 1 true
