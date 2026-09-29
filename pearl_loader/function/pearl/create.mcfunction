# Convert the chunk coordinates to the exact chunk-origin block coordinates.
scoreboard players operation #ox epl_x = #cx epl_x
scoreboard players operation #oz epl_z = #cz epl_z
scoreboard players operation #ox epl_x *= #sixteen epl_x
scoreboard players operation #oz epl_z *= #sixteen epl_z

# Put the coordinates into macro storage.
execute store result storage pearl_loader:macro x int 1 run scoreboard players get #ox epl_x
execute store result storage pearl_loader:macro z int 1 run scoreboard players get #oz epl_z
function pearl_loader:pearl/create_at_corner with storage pearl_loader:macro
