# ==========================================
# Aetherax - Attack Dispatcher (global scores)
# Weighted RNG attack selection per phase
# ==========================================

# Skip if channeling
execute if entity @s[tag=aetherax_channeling] run return fail

# Random 0-99
scoreboard players set #roll aetherax_timer 0
execute store result score #roll aetherax_timer run random value 0..99

# ===== Phase 1 =====
execute if entity @s[tag=aetherax_p1] run execute if score #roll aetherax_timer matches 0..24 run function aetherax:attacks/void_slash
execute if entity @s[tag=aetherax_p1] run execute if score #roll aetherax_timer matches 25..99 run function aetherax:attacks/rift_barrage

# ===== Phase 2 =====
execute unless entity @s[tag=aetherax_p3] run execute if entity @s[tag=aetherax_p2] run execute if score #roll aetherax_timer matches 0..19 run function aetherax:attacks/void_slash
execute unless entity @s[tag=aetherax_p3] run execute if entity @s[tag=aetherax_p2] run execute if score #roll aetherax_timer matches 20..44 run function aetherax:attacks/rift_barrage
execute unless entity @s[tag=aetherax_p3] run execute if entity @s[tag=aetherax_p2] run execute if score #roll aetherax_timer matches 45..79 run function aetherax:attacks/void_lance
execute unless entity @s[tag=aetherax_p3] run execute if entity @s[tag=aetherax_p2] run execute if score #roll aetherax_timer matches 80..99 run function aetherax:attacks/wisp_swarm

# ===== Phase 3 =====
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 0..9 run function aetherax:attacks/void_slash
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 10..24 run function aetherax:attacks/rift_barrage
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 25..49 run function aetherax:attacks/void_lance
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 50..64 run function aetherax:attacks/wisp_swarm
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 65..79 run function aetherax:attacks/meteor_rain

# Gravity well with global cooldown check
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 80..89 run execute if score #gw_cooldown aetherax_timer matches ..0 run function aetherax:attacks/gravity_well
execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 80..89 run execute unless score #gw_cooldown aetherax_timer matches ..0 run function aetherax:attacks/rift_barrage

execute if entity @s[tag=aetherax_p3] run execute if score #roll aetherax_timer matches 90..99 run function aetherax:attacks/void_channel

# Set global attack cooldown
execute if entity @s[tag=aetherax_p1] run scoreboard players set #atk_cd aetherax_timer 100
execute unless entity @s[tag=aetherax_p3] run execute if entity @s[tag=aetherax_p2] run scoreboard players set #atk_cd aetherax_timer 50
execute if entity @s[tag=aetherax_p3] run scoreboard players set #atk_cd aetherax_timer 30
