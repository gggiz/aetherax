# ==========================================
# Aetherax - Crystal Orbit Init
# Spawns 3 item_display entities that orbit the boss
# ==========================================

# Crystal 1 - large orbit, slow speed (radius 4)
summon minecraft:item_display ~ ~1.5 ~3 {Tags:["aetherax_crystal","aetherax_crystal_1"],item:{id:"minecraft:ender_eye",Count:1b},item_display:"thirdperson_righthand",brightness:{block:15,sky:15},glow_color_override:6291455,transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[1.5f,1.5f,1.5f],right_rotation:[0f,0f,0f,1f]}}

# Crystal 2 - medium orbit, medium speed (radius 3.5)
summon minecraft:item_display ~ ~1.5 ~3.5 {Tags:["aetherax_crystal","aetherax_crystal_2"],item:{id:"minecraft:nether_star",Count:1b},item_display:"thirdperson_righthand",brightness:{block:15,sky:15},glow_color_override:12451840,transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[1.2f,1.2f,1.2f],right_rotation:[0f,0f,0f,1f]}}

# Crystal 3 - tight orbit, fast speed (radius 3)
summon minecraft:item_display ~ ~1.5 ~2.5 {Tags:["aetherax_crystal","aetherax_crystal_3"],item:{id:"minecraft:ender_eye",Count:1b,components:{"minecraft:enchantment_glint_override":true}},item_display:"thirdperson_righthand",brightness:{block:15,sky:15},glow_color_override:11141120,transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[1.0f,1.0f,1.0f],right_rotation:[0f,0f,0f,1f]}}
