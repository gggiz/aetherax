# ==========================================
# Clean up ALL Aetherax entities
# Run: /function aetherax:test/cleanup
# ==========================================
kill @e[tag=aetherax_rift]
kill @e[tag=aetherax_pending]
kill @e[tag=aetherax_lance]
kill @e[tag=aetherax_meteor]
kill @e[tag=aetherax_wisp]
kill @e[tag=aetherax_anchor]
tellraw @a {"text":"已清除所有 Aetherax 实体","color":"green"}
