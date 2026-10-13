# Summon at the exact X/Z chunk origin. For Y always go to world bottom.
# The temporary tag identifies THIS newly-created marker unambiguously.
$execute positioned $(x) ~ $(z) run summon minecraft:marker ~ -64 ~ {Tags:["pearl_chunk_controller","pearl_new_controller"]}

# Store this chunk's identity and its unloaddelay based lifetime on the new marker.
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players operation @s epl_age = #EPLscores epl_unloaddelay
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players operation @s epl_x = #cx epl_x
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players operation @s epl_z = #cz epl_z

# Force-load the exact chunk represented by the controller.
$execute positioned $(x) ~ $(z) run forceload add ~ ~

# The temporary tag is only for creation; the controller remains permanent until its timer expires.
tag @e[type=minecraft:marker,tag=pearl_new_controller] remove pearl_new_controller
