# ==========================================
# Aetherax - Phase Check
# Detects HP thresholds and triggers phase transitions
# ==========================================

# Store current HP
execute store result score #hp aetherax_timer run data get entity @s Health

# --- P1 -> P2 transition (HP 101-199) ---
execute if score #hp aetherax_timer matches 101..199 run execute unless entity @s[tag=aetherax_p3] run execute unless entity @s[tag=aetherax_p2] run scoreboard players set #next_phase aetherax_timer 2
execute if score #hp aetherax_timer matches 101..199 run execute unless entity @s[tag=aetherax_p3] run execute unless entity @s[tag=aetherax_p2] run function aetherax:effects/phase_transition
execute if score #hp aetherax_timer matches 101..199 run tag @s add aetherax_p2
execute if score #hp aetherax_timer matches 101..199 run tag @s remove aetherax_p1

# --- P2 -> P3 transition (HP <= 100) ---
execute if score #hp aetherax_timer matches ..100 run execute unless entity @s[tag=aetherax_p3] run scoreboard players set #next_phase aetherax_timer 3
execute if score #hp aetherax_timer matches ..100 run execute unless entity @s[tag=aetherax_p3] run function aetherax:effects/phase_transition
execute if score #hp aetherax_timer matches ..100 run tag @s add aetherax_p3
execute if score #hp aetherax_timer matches ..100 run tag @s remove aetherax_p2
execute if score #hp aetherax_timer matches ..100 run tag @s remove aetherax_p1

# --- Rage mode: HP ≤ 50 → Strength II + Speed II + Sculk orbiter (once) ---
execute if score #hp aetherax_timer matches ..50 unless entity @s[tag=aetherax_enraged] run effect give @s minecraft:strength 30 1 true
execute if score #hp aetherax_timer matches ..50 unless entity @s[tag=aetherax_enraged] run effect give @s minecraft:speed 30 1 true
execute if score #hp aetherax_timer matches ..50 unless entity @s[tag=aetherax_enraged] run summon minecraft:item_display ~ ~1 ~ {Tags:["aetherax_sculk"],item:{id:"minecraft:sculk",count:1},item_display:"fixed",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[2.5f,2.5f,2.5f],right_rotation:[0f,0f,0f,1f]}}
execute if score #hp aetherax_timer matches ..50 unless entity @s[tag=aetherax_enraged] run title @a[distance=..30] title {"text":"虚空···吞噬一切！","color":"dark_purple","bold":true}
execute if score #hp aetherax_timer matches ..50 unless entity @s[tag=aetherax_enraged] run title @a[distance=..30] subtitle {"text":"艾瑟拉克斯陷入狂怒","color":"light_purple"}
execute if score #hp aetherax_timer matches ..50 run tag @s add aetherax_enraged

# --- Update phase in storage ---
execute if entity @s[tag=aetherax_p3] run data modify storage aetherax:boss phase set value 3
execute if entity @s[tag=aetherax_p2] run data modify storage aetherax:boss phase set value 2
