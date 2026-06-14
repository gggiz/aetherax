# Re-enable boss AI after Void Slash
execute as @e[tag=aetherax_boss,tag=!aetherax_dead,limit=1] unless entity @s[tag=aetherax_channeling] run data merge entity @s {NoAI:0b}
