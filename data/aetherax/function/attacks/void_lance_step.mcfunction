# Void Lance - beam particles from boss to target
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..60] ~ ~ ~ 1.0 1.0

# Beam: particles along line from boss toward target (caret notation)
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^1 0.1 0.1 0.1 0.01 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^3 0.1 0.1 0.1 0.01 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^5 0.1 0.1 0.1 0.01 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^7 0.1 0.1 0.1 0.01 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^9 0.1 0.1 0.1 0.01 5 force
execute as @e[tag=aetherax_boss,limit=1] at @s anchored eyes facing entity @e[tag=aetherax_lance_target,distance=..40,limit=1] eyes run particle minecraft:end_rod ^ ^ ^11 0.1 0.1 0.1 0.01 5 force

# Impact at target (anchored to boss position)
execute at @e[tag=aetherax_boss,limit=1] run playsound minecraft:entity.generic.explode hostile @a[distance=..40] ~ ~ ~ 1.0 1.0
execute at @e[tag=aetherax_boss,limit=1] run execute at @e[tag=aetherax_lance_target,distance=..40,limit=1] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute at @e[tag=aetherax_boss,limit=1] run execute at @e[tag=aetherax_lance_target,distance=..40,limit=1] run particle minecraft:dragon_breath ~ ~1 ~ 1 1 1 0.05 30 force

# Damage target
execute at @e[tag=aetherax_boss,limit=1] run execute as @e[tag=aetherax_lance_target,distance=..40,limit=1] run damage @s 14 minecraft:magic

# Cleanup
tag @e[tag=aetherax_lance_target] remove aetherax_lance_target
scoreboard players set #lance_cd aetherax_timer -1
