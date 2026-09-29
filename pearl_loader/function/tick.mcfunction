# Process every currently loaded Ender Pearl.
execute as @e[type=minecraft:ender_pearl] at @s run function pearl_loader:pearl

# Age every controller after the pearl-refresh pass.
execute as @e[type=minecraft:marker,tag=pearl_chunk_controller] run function pearl_loader:controller/tick
