# ==========================================
# Aetherax - Load Function
# One-time setup: scoreboards, storage, triggers
# ==========================================

# --- Teams ---
team add aetherax_anchor_team
team modify aetherax_anchor_team color dark_purple

# --- Scoreboards ---
scoreboard objectives add aetherax_vars dummy
scoreboard objectives add aetherax_timer dummy
scoreboard objectives add aetherax_spawn trigger
scoreboard objectives add aetherax_use_heart minecraft.used:minecraft.end_crystal
scoreboard objectives add aetherax_use_sword minecraft.used:minecraft.netherite_sword
scoreboard players set #boss_state aetherax_vars 0
scoreboard players set #max_hp aetherax_timer 300
scoreboard players set #rift_delay aetherax_timer -1
scoreboard players set #lance_cd aetherax_timer -1

# --- Data Storage ---
data merge storage aetherax:boss {active:false,phase:1,uuid:"",arena:{x:0,y:0,z:0},timer:0}
data merge storage aetherax:state {phase_transitioning:false,channel_active:false}

# --- Enable trigger for all online players ---
scoreboard players enable @a aetherax_spawn

# --- Console confirmation ---
tellraw @a ["",{"text":"[艾瑟拉克斯] ","color":"dark_purple","bold":true},{"text":"数据包已加载。使用 ","color":"gray"},{"text":"/trigger aetherax_spawn set 1","color":"light_purple"},{"text":" 或合成虚空信标来召唤Boss。","color":"gray"}]
