# Void Channel - Interrupted!

# Boss staggered — remove invulnerability, strip armor (vulnerable), slow + weak
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run data merge entity @s {Invulnerable:0b}
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run effect give @s minecraft:slowness 3 5 true
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run effect give @s minecraft:weakness 5 2 true
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run attribute @s minecraft:armor base set 0
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run damage @s 30 minecraft:out_of_world
execute as @e[tag=aetherax_boss,tag=aetherax_channeling,limit=1] run tag @s remove aetherax_channeling
scoreboard players set #armor_recover aetherax_timer 100

# VFX and sound at boss position
execute as @e[tag=aetherax_boss,limit=1] at @s run playsound minecraft:block.glass.break hostile @a[distance=..60] ~ ~ ~ 2.0 1.5
execute as @e[tag=aetherax_boss,limit=1] at @s run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 10 force

# Clear darkness and feedback
execute as @e[tag=aetherax_boss,limit=1] at @s run effect clear @a[distance=..60] minecraft:darkness
execute as @e[tag=aetherax_boss,limit=1] at @s run title @a[distance=..60] actionbar {"text":"虚空引导被中断！艾瑟拉克斯陷入虚弱！","color":"green","bold":true}

scoreboard players set #channel_timer aetherax_timer -1
