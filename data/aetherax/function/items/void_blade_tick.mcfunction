# Void Blade wielder: extended reach (10 blocks) + void magic damage (via advancement/tick)
# Tag persists — effects apply to any netherite sword while tagged.
# Use /tag @s remove aetherax_void_wielder to unbind before enchanting a new sword.

# Apply reach modifier to tagged players currently holding netherite sword
execute as @a[tag=aetherax_void_wielder] if items entity @s weapon.mainhand minecraft:netherite_sword run attribute @s minecraft:entity_interaction_range modifier add aetherax:void_reach 7 add_value

# Remove reach modifier from tagged players NOT holding netherite sword
execute as @a[tag=aetherax_void_wielder] unless items entity @s weapon.mainhand minecraft:netherite_sword run attribute @s minecraft:entity_interaction_range modifier remove aetherax:void_reach

# Cleanup reach modifier from non-tagged players
execute as @a[tag=!aetherax_void_wielder] run attribute @s minecraft:entity_interaction_range modifier remove aetherax:void_reach
