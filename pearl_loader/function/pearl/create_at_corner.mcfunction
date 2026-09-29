# Summon at the exact X/Z chunk origin. Keep the pearl's Y coordinate.
# The temporary tag identifies THIS newly-created marker unambiguously.
$execute positioned $(x) ~ $(z) run summon minecraft:marker ~ ~ ~ {Tags:["pearl_chunk_controller","pearl_new_controller"]}

# Store this chunk's identity and its 10-second lifetime on the new marker.
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players set @s epl_age 200
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players operation @s epl_x = #cx epl_x
execute as @e[type=minecraft:marker,tag=pearl_new_controller,limit=1] run scoreboard players operation @s epl_z = #cz epl_z

# Force-load the exact chunk represented by the controller.
$execute positioned $(x) ~ $(z) run forceload add ~ ~

# The temporary tag is only for creation; the controller remains permanent until its timer expires.
tag @e[type=minecraft:marker,tag=pearl_new_controller] remove pearl_new_controller
