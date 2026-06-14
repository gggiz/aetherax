# Aetherax - Death VFX Phase 0 (immediate)
# Death anchor: @e[tag=aetherax_death_anchor]

# Massive initial explosion ring at anchor
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:explosion_emitter ~ ~ ~ 3 4 3 0.1 30 force
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dragon_breath ~ ~ ~ 6 6 6 0 120 force
execute at @e[tag=aetherax_death_anchor,limit=1] run particle minecraft:dust{color:[0.3,0.0,0.6],scale:2.0} ~ ~ ~ 4 4 4 0 80 force

# Death roar
execute at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:entity.wither.death hostile @a[distance=..80] ~ ~ ~ 2.0 0.3
execute at @e[tag=aetherax_death_anchor,limit=1] run playsound minecraft:entity.ender_dragon.death hostile @a[distance=..80] ~ ~ ~ 2.0 1.0

# Lightning
execute at @e[tag=aetherax_death_anchor,limit=1] run summon minecraft:lightning_bolt ~ ~ ~

# Implosion pull
execute at @e[tag=aetherax_death_anchor,limit=1] run tp @e[distance=..8,type=!player] ~ ~ ~
