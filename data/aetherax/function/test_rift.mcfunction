tellraw @a {"text":"Running rift_barrage...","color":"yellow"}
execute as @e[tag=aetherax_boss,limit=1] at @s run function aetherax:attacks/rift_barrage
