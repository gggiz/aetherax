# Void eye VFX above player on hit
# @s = void wielder who just hit an entity

# Eye outline
execute at @s positioned ^ ^2.6 ^1.5 run particle minecraft:dust{color:[0.4,0.0,0.7],scale:1.8} ^-0.8 ^-0.2 ^-0.05 1.6 0.5 0.1 0 10
execute at @s positioned ^ ^2.3 ^1.5 run particle minecraft:dust{color:[0.4,0.0,0.7],scale:1.4} ^-0.5 ^-0.1 ^-0.05 1.0 0.3 0.1 0 6

# Iris glow
execute at @s positioned ^ ^2.6 ^1.5 run particle minecraft:dust{color:[0.6,0.1,0.9],scale:1.0} ^-0.2 ^-0.15 ^-0.05 0.4 0.3 0.1 0 8

# Pupil
execute at @s positioned ^ ^2.6 ^1.5 run particle minecraft:dust{color:[0.1,0.0,0.2],scale:0.6} ^-0.05 ^-0.05 ^-0.05 0.1 0.1 0.1 0 3

# Center portal
execute at @s positioned ^ ^2.6 ^1.5 run particle minecraft:portal ^ ^ ^ 0.05 0.05 0.05 0.01 3

# Sound
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.5 1.8
