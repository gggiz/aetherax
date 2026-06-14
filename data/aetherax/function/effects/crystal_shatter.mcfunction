# ==========================================
# Aetherax - Crystal Shatter VFX
# Destroys one crystal with dramatic explosion effect
# ==========================================

# Explosion particles at crystal position
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle minecraft:dragon_breath ~ ~ ~ 1 1 1 0 30 force

# Shatter sound
playsound minecraft:block.glass.break hostile @a[distance=..60] ~ ~ ~ 1.5 1.5
playsound minecraft:entity.wither.shoot hostile @a[distance=..60] ~ ~ ~ 1.0 0.5

# Drop particles (amethyst shards flying outward)
particle minecraft:scrape ~ ~ ~ 0.8 0.8 0.8 0.3 25

# Remove the crystal
kill @s
