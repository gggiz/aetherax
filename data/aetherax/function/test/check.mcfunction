# ==========================================
# Entity diagnostic - check for lingering entities
# Run: /function aetherax:test/check
# ==========================================
tellraw @a {"text":"========== 实体诊断 ==========","color":"gold"}

# Rifts (armor_stand)
execute if entity @e[tag=aetherax_rift] run tellraw @a {"text":"[!] 裂隙标记(aetherax_rift): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_rift] run tellraw @a {"text":"[OK] 裂隙标记: 无","color":"green"}

# Pending rifts
execute if entity @e[tag=aetherax_pending] run tellraw @a {"text":"[!] 待爆裂隙(aetherax_pending): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_pending] run tellraw @a {"text":"[OK] 待爆裂隙: 无","color":"green"}

# Lances (area_effect_cloud)
execute if entity @e[tag=aetherax_lance] run tellraw @a {"text":"[!] 光矛标记(aetherax_lance): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_lance] run tellraw @a {"text":"[OK] 光矛标记: 无","color":"green"}

# Meteors (falling_block)
execute if entity @e[tag=aetherax_meteor] run tellraw @a {"text":"[!] 陨石(aetherax_meteor): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_meteor] run tellraw @a {"text":"[OK] 陨石: 无","color":"green"}

# Wisps (vex)
execute if entity @e[tag=aetherax_wisp] run tellraw @a {"text":"[!] 魂火(aetherax_wisp): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_wisp] run tellraw @a {"text":"[OK] 魂火: 无","color":"green"}

# Anchors (zombie)
execute if entity @e[tag=aetherax_anchor] run tellraw @a {"text":"[!] 虚空锚点(aetherax_anchor): 存在！","color":"red"}
execute unless entity @e[tag=aetherax_anchor] run tellraw @a {"text":"[OK] 虚空锚点: 无","color":"green"}

tellraw @a {"text":"================================","color":"gold"}
