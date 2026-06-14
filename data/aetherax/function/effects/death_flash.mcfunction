# Aetherax - Escalating death flashes (20/40 ticks)
# Positioned at death anchor

# --- Phase 1 (20 ticks = 1s): Void energy surge ---
execute if score #death_flash aetherax_timer matches 20 at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dragon_breath ~ ~ ~ 6 6 6 0 80 force
execute if score #death_flash aetherax_timer matches 20 at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:portal ~ ~ ~ 4 4 4 0.05 50 force
execute if score #death_flash aetherax_timer matches 20 at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:block.respawn_anchor.deplete hostile @a[distance=..60] ~ ~ ~ 1.5 1.5
execute if score #death_flash aetherax_timer matches 20 at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~2 ~ ~

# --- Phase 2 (40 ticks = 2s): Stronger pulse ---
execute if score #death_flash aetherax_timer matches 40 at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dragon_breath ~ ~ ~ 8 8 8 0 120 force
execute if score #death_flash aetherax_timer matches 40 at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dust{color:[0.5,0.0,0.8],scale:2.5} ~ ~ ~ 5 5 5 0 100 force
execute if score #death_flash aetherax_timer matches 40 at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:entity.generic.explode hostile @a[distance=..60] ~ ~ ~ 1.5 0.8
execute if score #death_flash aetherax_timer matches 40 at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~-2 ~ ~
execute if score #death_flash aetherax_timer matches 40 at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~ ~ ~2

# --- Phase 3 (60 ticks = 3s): Final cataclysm ---
execute if score #death_flash aetherax_timer matches 60 run function aetherax:effects/death_final
