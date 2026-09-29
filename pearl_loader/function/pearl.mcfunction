# Get the pearl's integer block coordinates.
execute store result score #px epl_x run data get entity @s Pos[0] 1
execute store result score #pz epl_z run data get entity @s Pos[2] 1

# Integer-divide by 16 to get the chunk coordinate.
# Java scoreboard division truncates toward zero, so fix negative remainders afterward.
scoreboard players operation #cx epl_x = #px epl_x
scoreboard players operation #cz epl_z = #pz epl_z
scoreboard players operation #cx epl_x /= #sixteen epl_x
scoreboard players operation #cz epl_z /= #sixteen epl_z

scoreboard players operation #rx epl_x = #px epl_x
scoreboard players operation #rz epl_z = #pz epl_z
scoreboard players operation #rx epl_x %= #sixteen epl_x
scoreboard players operation #rz epl_z %= #sixteen epl_z
execute if score #rx epl_x matches ..-1 run scoreboard players remove #cx epl_x 1
execute if score #rz epl_z matches ..-1 run scoreboard players remove #cz epl_z 1

# Mark controllers belonging to this exact chunk.
execute as @e[type=minecraft:marker,tag=pearl_chunk_controller] if score @s epl_x = #cx epl_x if score @s epl_z = #cz epl_z run tag @s add pearl_chunk_match

# Any pearl in this chunk resets its controller to 200 ticks.
execute as @e[type=minecraft:marker,tag=pearl_chunk_match] run scoreboard players set @s epl_age 200

# Create exactly one controller if this chunk has none.
execute unless entity @e[type=minecraft:marker,tag=pearl_chunk_match] run function pearl_loader:pearl/create

tag @e[type=minecraft:marker,tag=pearl_chunk_match] remove pearl_chunk_match
