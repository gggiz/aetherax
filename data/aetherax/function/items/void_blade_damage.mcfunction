# Void blade: first-hit injection or VFX on subsequent hits
# @s = player who attacked

# Revoke advancement so it can fire again next hit
advancement revoke @s only aetherax:void_blade_hit

# Must be holding netherite sword
execute unless items entity @s weapon.mainhand minecraft:netherite_sword run return fail

# Void wielder → tag target entity for damage next tick, then VFX
execute if entity @s[tag=aetherax_void_wielder] at @s anchored eyes positioned ^ ^ ^5 run tag @e[type=!player,distance=..5,limit=1,sort=nearest] add aetherax_void_target
execute if entity @s[tag=aetherax_void_wielder] run function aetherax:items/void_blade_vfx

# Not a wielder → try first-hit injection
execute unless entity @s[tag=aetherax_void_wielder] run function aetherax:items/void_enchant_inject
