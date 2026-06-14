# Select nearest enemy as target, tag them
tag @e[tag=aetherax_target] remove aetherax_target
execute as @s at @s run tag @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..64,sort=nearest,limit=1] add aetherax_target
