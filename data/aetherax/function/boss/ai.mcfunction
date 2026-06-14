# ==========================================
# Aetherax - Core AI Loop (per-boss, global scores)
# Runs every tick while boss is alive, @s = boss
# ==========================================

# --- Global timer ---
scoreboard players add #g_timer aetherax_timer 1
execute if score #g_timer aetherax_timer matches 22.. run scoreboard players set #g_timer aetherax_timer 0

# --- Health check + phase detection ---
execute store result score #hp aetherax_timer run data get entity @s Health
execute if score #hp aetherax_timer matches ..0 run tag @s add aetherax_dead
execute if score #hp aetherax_timer matches ..0 run function aetherax:boss/death
execute if score #hp aetherax_timer matches 1.. run function aetherax:boss/phase_check

# --- Ambient particles (every tick) ---
execute as @s at @s run function aetherax:effects/ambient_particles

# --- Orbital crystal rotation (every tick) ---
execute as @s at @s run function aetherax:boss/orbital_update

# --- Target selection + passive regen (every 20 ticks = 1 sec) ---
execute if score #g_timer aetherax_timer matches 20 run function aetherax:boss/target_select
execute if score #g_timer aetherax_timer matches 20 unless entity @s[tag=aetherax_dead] run execute store result score #regen_hp aetherax_timer run data get entity @s Health
execute if score #g_timer aetherax_timer matches 20 unless entity @s[tag=aetherax_dead] run scoreboard players add #regen_hp aetherax_timer 1
execute if score #g_timer aetherax_timer matches 20 unless entity @s[tag=aetherax_dead] run execute if score #regen_hp aetherax_timer matches 301.. run scoreboard players set #regen_hp aetherax_timer 300
execute if score #g_timer aetherax_timer matches 20 unless entity @s[tag=aetherax_dead] run execute store result entity @s Health float 1 run scoreboard players get #regen_hp aetherax_timer

# --- Attack cooldown ---
scoreboard players remove #atk_cd aetherax_timer 1
execute if score #atk_cd aetherax_timer matches ..0 run function aetherax:attacks/attack_dispatcher

# --- Wipe reset: if no players nearby for 30s, regen to full + clear minions ---
execute unless entity @a[distance=..80] run scoreboard players add #despawn_timer aetherax_timer 1
execute if entity @a[distance=..80] run scoreboard players set #despawn_timer aetherax_timer 0
execute if score #despawn_timer aetherax_timer matches 600.. run execute store result entity @s Health float 1 run scoreboard players get #max_hp aetherax_timer
execute if score #despawn_timer aetherax_timer matches 600.. run effect clear @s
execute if score #despawn_timer aetherax_timer matches 600.. run kill @e[tag=aetherax_wisp]
execute if score #despawn_timer aetherax_timer matches 600.. run kill @e[tag=aetherax_sculk]
execute if score #despawn_timer aetherax_timer matches 600.. run kill @e[tag=aetherax_rift]
execute if score #despawn_timer aetherax_timer matches 600.. run kill @e[tag=aetherax_lance]
execute if score #despawn_timer aetherax_timer matches 600.. run scoreboard players set #despawn_timer aetherax_timer 0
