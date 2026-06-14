# Void Channel - tick check

scoreboard players add #channel_timer aetherax_timer 1

# Refresh aggro — anchor "attacks" nearby creatures to maintain threat
execute as @e[tag=!aetherax_boss,tag=!aetherax_wisp,tag=!aetherax_anchor,distance=..20] at @s run damage @s 1 minecraft:generic by @e[tag=aetherax_anchor,limit=1]

# Anchor particles
execute at @e[tag=aetherax_anchor] run particle minecraft:electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.2 10 force

# Timer display (position at anchor so distance check works)
execute at @e[tag=aetherax_anchor,limit=1] run title @a[distance=..60] actionbar {"text":"虚空锚点 · 剩余 ","color":"light_purple","extra":[{"score":{"name":"#channel_timer","objective":"aetherax_timer"},"color":"gold"},{"text":" / 8 秒","color":"light_purple"}]}

# Anchor destroyed -> interrupt
execute unless entity @e[tag=aetherax_anchor] run function aetherax:attacks/void_channel_interrupt

# Time's up -> detonate
execute if score #channel_timer aetherax_timer matches 8 run function aetherax:attacks/void_channel_detonate

# Continue (re-triggered by tick when channel_cd reaches 0)
execute if score #channel_timer aetherax_timer matches ..7 run execute if entity @e[tag=aetherax_anchor] run scoreboard players set #channel_cd aetherax_timer 20
