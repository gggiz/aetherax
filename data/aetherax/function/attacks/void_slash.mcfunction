# ==========================================
# Aetherax - Void Slash
# Teleports behind target for a devastating melee strike
# ==========================================

# Warning sound
playsound minecraft:entity.enderman.scream hostile @a[distance=..50] ~ ~ ~ 1.0 0.3

# Tag nearest enemy as target (exclude boss and minions)
execute at @s run tag @e[tag=!aetherax_boss,tag=!aetherax_wisp,distance=..32,sort=nearest,limit=1] add aetherax_target

# Teleport behind the target (exclude wisps from target reference)
execute at @e[tag=aetherax_target,tag=!aetherax_wisp,limit=1] anchored eyes positioned ^ ^ ^-3 run tp @s ~ ~ ~ facing entity @e[tag=aetherax_target,tag=!aetherax_wisp,limit=1]

# Arrival VFX
particle minecraft:portal ~ ~1 ~ 0.5 1 0.5 0.01 50 force
particle minecraft:portal ~ ~1 ~ 0.8 1.5 0.8 0.02 40 force
particle minecraft:dragon_breath ~ ~1 ~ 0.5 1 0.5 0.01 15 force
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle minecraft:sweep_attack ~ ~1.5 ~ 1.5 0.5 1.5 0 10

# Damage target
execute as @e[tag=aetherax_target,tag=!aetherax_wisp,distance=..4,limit=1] run damage @s 18 minecraft:player_attack

# Debuff: darkness + slowness
effect give @e[tag=aetherax_target,tag=!aetherax_wisp,distance=..4,limit=1] minecraft:darkness 3 0 true
effect give @e[tag=aetherax_target,tag=!aetherax_wisp,distance=..4,limit=1] minecraft:slowness 5 2 true

# Attack sound
playsound minecraft:entity.player.attack.sweep hostile @a[distance=..40] ~ ~ ~ 1.5 0.3
playsound minecraft:entity.enderman.teleport hostile @a[distance=..40] ~ ~ ~ 0.8 2.0

# Re-enable AI after short delay (10 ticks = 0.5s, tick-based)
scoreboard players set #slash_recover aetherax_timer 10

# Clean target tag
tag @e[tag=aetherax_target] remove aetherax_target
