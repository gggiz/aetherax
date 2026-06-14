# ==========================================
# Aetherax - Arena Creation
# Builds a void-themed battle arena at summon location
# ==========================================

# Replace ground with dark flooring in a 24-block radius
fill ~-24 ~-1 ~-24 ~24 ~-1 ~24 minecraft:black_concrete replace minecraft:grass_block
fill ~-24 ~-1 ~-24 ~24 ~-1 ~24 minecraft:black_concrete replace minecraft:dirt
fill ~-24 ~-1 ~-24 ~24 ~-1 ~24 minecraft:black_concrete replace minecraft:stone
fill ~-24 ~-1 ~-24 ~24 ~-1 ~24 minecraft:black_concrete replace minecraft:sand
fill ~-24 ~-1 ~-24 ~24 ~-1 ~24 minecraft:black_concrete replace minecraft:gravel

# Inner ring of purple concrete (22-block radius)
fill ~-22 ~-1 ~-22 ~22 ~-1 ~22 minecraft:purple_concrete replace minecraft:black_concrete

# Glowstone circle at the 20-block boundary
fill ~-20 ~0 ~-20 ~20 ~0 ~20 minecraft:black_concrete replace minecraft:air
execute at @s run fill ~-20 ~0 ~-20 ~20 ~0 ~20 minecraft:glowstone replace minecraft:black_concrete

# Central ritual marker
setblock ~ ~-1 ~ minecraft:crying_obsidian

# Particle pillars at 16 points around the arena circle (N,S,E,W + diagonals)
particle minecraft:end_rod ~20 ~0 ~ 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~-20 ~0 ~ 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~ ~0 ~20 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~ ~0 ~-20 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~14 ~0 ~14 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~-14 ~0 ~-14 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~14 ~0 ~-14 0.1 3 0.1 0 0 force
particle minecraft:end_rod ~-14 ~0 ~14 0.1 3 0.1 0 0 force

# Spawn 16 barrier pillars around the perimeter (ring of beacon-like columns)
summon minecraft:armor_stand ~20 ~0 ~ {Invisible:1b,Marker:1b,Tags:["arena_pillar"],CustomName:'{"text":"Circlet 1"}',CustomNameVisible:0b}
summon minecraft:armor_stand ~-20 ~0 ~ {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~ ~0 ~20 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~ ~0 ~-20 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~14 ~0 ~14 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-14 ~0 ~-14 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~14 ~0 ~-14 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-14 ~0 ~14 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~10.5 ~0 ~18 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-10.5 ~0 ~18 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~10.5 ~0 ~-18 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-10.5 ~0 ~-18 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~18 ~0 ~10.5 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-18 ~0 ~10.5 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~18 ~0 ~-10.5 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
summon minecraft:armor_stand ~-18 ~0 ~-10.5 {Invisible:1b,Marker:1b,Tags:["arena_pillar"]}
