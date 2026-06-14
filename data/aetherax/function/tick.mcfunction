# ==========================================
# Aetherax - Tick Function (all timer-based, no schedule)
# ==========================================

# --- Crystal orbit angle (global, once per tick) ---
scoreboard players add #orb_angle aetherax_timer 3
execute if score #orb_angle aetherax_timer matches 360.. run scoreboard players set #orb_angle aetherax_timer 0

# --- Boss AI ---
execute as @e[tag=aetherax_boss,tag=!aetherax_dead] at @s run function aetherax:boss/ai

# --- Sculk orbiter (rage mode) ---
execute if entity @e[tag=aetherax_sculk] run function aetherax:boss/sculk_orbit

# --- Minion AI ---
execute as @e[tag=aetherax_wisp] at @s run function aetherax:minions/wisp_ai

# --- Meteor timer (countdown to detonation) ---
scoreboard players remove #meteor_timer aetherax_timer 1
execute if score #meteor_timer aetherax_timer matches 1 run function aetherax:attacks/meteor_detonate
execute if score #meteor_timer aetherax_timer matches -2 run scoreboard players set #meteor_timer aetherax_timer -1

# --- Void heart tag: mark players holding the void heart ---
tag @a remove aetherax_held_heart
execute as @a if items entity @s weapon.mainhand *[minecraft:custom_data~{aetherax:{void_heart:true}}] run tag @s add aetherax_held_heart
execute as @a if items entity @s weapon.offhand *[minecraft:custom_data~{aetherax:{void_heart:true}}] run tag @s add aetherax_held_heart

# --- Void heart pending tag: persist 5 ticks after item consumed ---
execute as @a[tag=aetherax_held_heart] run scoreboard players set @s aetherax_vars 5
execute as @a[scores={aetherax_vars=1..}] run tag @s add aetherax_held_heart
scoreboard players remove @a[scores={aetherax_vars=1..}] aetherax_vars 1

# --- Void heart detection (end crystal use + held heart tag) ---
execute as @a[scores={aetherax_use_heart=1..},tag=aetherax_held_heart] at @s if entity @e[type=minecraft:end_crystal,distance=..4,limit=1] run function aetherax:summon_from_heart
scoreboard players set @a aetherax_use_heart 0

# --- Voidwalker boots effect ---
function aetherax:items/voidwalker_boots

# --- Void blade tick (reach + damage detection) ---
function aetherax:items/void_blade_tick

# --- Void blade magic damage (deferred from advancement, target tagged on hit) ---
execute as @e[tag=aetherax_void_target] run function aetherax:items/void_damage
tag @e remove aetherax_void_target

# --- Spawn trigger ---
scoreboard players enable @a aetherax_spawn
execute as @a[scores={aetherax_spawn=1..}] at @s run function aetherax:summon
scoreboard players set @a[scores={aetherax_spawn=1..}] aetherax_spawn 0

# --- Void enchant: first-hit injection handled via void_blade_damage advancement ---


# --- Bossbar sync ---
execute if entity @e[tag=aetherax_boss,tag=!aetherax_dead] run function aetherax:boss/update_bossbar

# --- Boss death detection ---
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run bossbar remove aetherax_health
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run data modify storage aetherax:boss active set value false
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run kill @e[tag=aetherax_wisp]
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run kill @e[tag=aetherax_crystal]
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run kill @e[tag=aetherax_sculk]
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run bossbar remove aetherax_health
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run data modify storage aetherax:boss active set value false
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run title @a title {"text":"胜利！","color":"gold","bold":true}
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run title @a subtitle {"text":"艾瑟拉克斯已被击败","color":"green"}
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run function aetherax:boss/death_reward
execute if score #boss_state aetherax_vars matches 1 run execute unless entity @e[tag=aetherax_boss] run scoreboard players set #boss_state aetherax_vars 0

# ===== Tick-based timers (replacing all schedule calls) =====

# --- Rift detonation: decrement timer, trigger at 1, clamp idle ---
execute if entity @e[tag=aetherax_pending] run execute at @e[tag=aetherax_pending] run particle minecraft:portal ~ ~1 ~ 0.8 0.8 0.8 0.05 10 force
scoreboard players remove #rift_delay aetherax_timer 1

execute if score #rift_delay aetherax_timer matches 1 run function aetherax:attacks/rift_detonate
execute if score #rift_delay aetherax_timer matches -2 run scoreboard players set #rift_delay aetherax_timer -1

# --- Void lance stepping ---
scoreboard players remove #lance_cd aetherax_timer 1
execute if score #lance_cd aetherax_timer matches 1 run function aetherax:attacks/void_lance_step
execute if score #lance_cd aetherax_timer matches -2 run scoreboard players set #lance_cd aetherax_timer -1

# --- Gravity well pulsing (every tick while gw_timer > 0) ---
execute if entity @e[tag=aetherax_boss,tag=aetherax_gravity_well] run execute if score #gw_timer aetherax_timer matches 1.. run function aetherax:attacks/gravity_well_pulse
execute if entity @e[tag=aetherax_boss,tag=aetherax_gravity_well] run execute if score #gw_timer aetherax_timer matches 1.. run scoreboard players remove #gw_timer aetherax_timer 1
execute if entity @e[tag=aetherax_boss,tag=aetherax_gravity_well] run execute if score #gw_timer aetherax_timer matches ..0 run function aetherax:attacks/gravity_well_burst
execute if entity @e[tag=aetherax_boss,tag=aetherax_gravity_well] run execute if score #gw_timer aetherax_timer matches ..0 run tag @e[tag=aetherax_boss,tag=aetherax_gravity_well] remove aetherax_gravity_well
execute if entity @e[tag=aetherax_boss,tag=aetherax_gravity_well] run execute if score #gw_timer aetherax_timer matches ..0 run scoreboard players set #gw_timer aetherax_timer -1

# --- Gravity well global cooldown decrement ---
scoreboard players remove #gw_cooldown aetherax_timer 1
execute if score #gw_cooldown aetherax_timer matches -2 run scoreboard players set #gw_cooldown aetherax_timer -1

# --- Void channel ticking (every 20 ticks = 1 second) ---
execute if entity @e[tag=aetherax_boss,tag=aetherax_channeling] run scoreboard players remove #channel_cd aetherax_timer 1
execute if entity @e[tag=aetherax_boss,tag=aetherax_channeling] run execute if score #channel_cd aetherax_timer matches ..0 run function aetherax:attacks/void_channel_tick
execute if entity @e[tag=aetherax_boss,tag=aetherax_channeling] run execute if score #channel_cd aetherax_timer matches ..0 run scoreboard players set #channel_cd aetherax_timer 20

# --- Void slash AI recovery (after 10 ticks = 0.5s) ---
execute if score #slash_recover aetherax_timer matches 1.. run scoreboard players remove #slash_recover aetherax_timer 1
execute if score #slash_recover aetherax_timer matches 0 run function aetherax:attacks/void_slash_recover

# --- Cleanup timer (after 100 ticks = 5s) ---
execute if score #cleanup_timer aetherax_timer matches 1.. run scoreboard players remove #cleanup_timer aetherax_timer 1
execute if score #cleanup_timer aetherax_timer matches 0 run function aetherax:boss/cleanup

# --- Phase resume timer (after 30 ticks = 1.5s) ---
execute if score #phase_resume aetherax_timer matches 1.. run scoreboard players remove #phase_resume aetherax_timer 1
execute if score #phase_resume aetherax_timer matches 0 run function aetherax:boss/resume_ai

# --- Armor recovery timer (after anchor death, 100 ticks = 5s) ---
execute if score #armor_recover aetherax_timer matches 1.. run scoreboard players remove #armor_recover aetherax_timer 1
execute if score #armor_recover aetherax_timer matches 1 run attribute @e[tag=aetherax_boss,limit=1] minecraft:armor base set 10
execute if score #armor_recover aetherax_timer matches 1 run scoreboard players set #armor_recover aetherax_timer -1

# --- Meteor block cleanup (fires 10 ticks after detonate) ---
execute if score #meteor_cleanup aetherax_timer matches 1.. run scoreboard players remove #meteor_cleanup aetherax_timer 1
execute if score #meteor_cleanup aetherax_timer matches 1 run execute at @e[tag=aetherax_boss,limit=1] run fill ~-30 ~-2 ~-30 ~30 ~5 ~30 minecraft:air replace minecraft:magma_block
execute if score #meteor_cleanup aetherax_timer matches 1 run scoreboard players set #meteor_cleanup aetherax_timer -1

# --- Safety cleanup: every 200 ticks (10s), kill lingering entities ---
scoreboard players add #safety_cleanup aetherax_timer 1
execute if score #safety_cleanup aetherax_timer matches 200.. run kill @e[tag=aetherax_rift]
execute if score #safety_cleanup aetherax_timer matches 200.. run kill @e[tag=aetherax_lance]
execute if score #safety_cleanup aetherax_timer matches 200.. run scoreboard players set #safety_cleanup aetherax_timer 0
