# Transform placed end crystal into boss summon

# Remove the placed end crystal (tp to void, explosion won't affect surface)
execute at @s run tp @e[type=minecraft:end_crystal,distance=..3,sort=nearest,limit=1] ~ -200 ~

# Summon boss at player's position
function aetherax:summon

# Revoke advancement for re-use
advancement revoke @s only aetherax:use_void_heart
