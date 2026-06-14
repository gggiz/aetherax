# ==========================================
# Aetherax - Cleanup
# Removes boss entity, bossbar, and all related entities
# ==========================================

# Kill the boss entity
kill @e[tag=aetherax_boss]

# Remove bossbar
bossbar remove aetherax_health

# Reset storage
data merge storage aetherax:boss {active:false,phase:1}

# Stop any scheduled functions (best-effort)
scoreboard players reset * aetherax_vars
scoreboard players reset * aetherax_timer
