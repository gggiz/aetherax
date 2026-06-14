# Aetherax - Void Channel (ULTIMATE, Phase 3)

# Invulnerable during channel (NoAI via data merge breaks in 1.26.1)
data merge entity @s {Invulnerable:1b}
tag @s add aetherax_channeling

# Darken arena (players only, non-players don't see darkness)
effect give @a[distance=..60] minecraft:darkness 8 0 true
effect give @a[distance=..60] minecraft:slowness 2 3 true

# Ominous heartbeat
playsound minecraft:entity.warden.heartbeat hostile @a[distance=..60] ~ ~ ~ 2.0 0.3

# Spawn Void Anchor - invisible zombie with crying obsidian on head
summon minecraft:zombie ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["aetherax_anchor"],Glowing:1b,CustomName:"虚空锚点",CustomNameVisible:1b,Health:40f}
team join aetherax_anchor_team @e[tag=aetherax_anchor,limit=1,sort=nearest]

# Set anchor attributes
attribute @e[tag=aetherax_anchor,limit=1,sort=nearest] minecraft:max_health base set 40
attribute @e[tag=aetherax_anchor,limit=1,sort=nearest] minecraft:scale base set 1.5
attribute @e[tag=aetherax_anchor,limit=1,sort=nearest] minecraft:knockback_resistance base set 1.0

# Ensure full HP
data merge entity @e[tag=aetherax_anchor,limit=1,sort=nearest] {Health:40f}

# Make invisible via effect
effect give @e[tag=aetherax_anchor,limit=1,sort=nearest] minecraft:invisibility 999999 0 true

# Put crying obsidian on head (looks like floating block)
item replace entity @e[tag=aetherax_anchor,limit=1,sort=nearest] armor.head with minecraft:crying_obsidian

# Warnings
title @a[distance=..60] title {"text":"","color":"dark_purple"}
title @a[distance=..60] subtitle {"text":"摧毁虚空锚点！","color":"gold","bold":true}
title @a[distance=..60] actionbar {"text":"虚空锚点正在引导灾变能量... 剩余 8 秒！","color":"light_purple"}

# Redirect all nearby creature aggro to the anchor
execute as @e[tag=!aetherax_boss,tag=!aetherax_wisp,tag=!aetherax_anchor,distance=..20] at @s run damage @s 1 minecraft:generic by @e[tag=aetherax_anchor,limit=1]

# Start timer (tick-based: channel_cd counts 20-tick intervals)
scoreboard players set #channel_timer aetherax_timer 0
scoreboard players set #channel_cd aetherax_timer 20
