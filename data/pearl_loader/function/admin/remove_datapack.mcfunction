# This function is only for manual use!

# WARNING: Running this will disable the datapack and delete all the scores, unload chunks and remove all the controllers!
# Only run this if your intent is to stop using the datapack, to fix certain chunks having failed to forceload run pearl_loader:admin/fix_chunks


# Step 1: Remove the forceloading from all marked chunks and delete their controller markers
execute as @e[type=minecraft:marker,tag=pearl_chunk_controller] at @s run function pearl_loader:do_not_run_manually/controller/remove

# Step 2: Remove all scoreboard objectives that belong to this pack
scoreboard objectives remove epl_age
scoreboard objectives remove epl_x
scoreboard objectives remove epl_z
scoreboard objectives remove epl_two
scoreboard objectives remove epl_unloaddelay

# Step 3: Disable the datapack to prevent it from trying to run next tick, which would cause a lot of errors
tellraw @s ["",{text:"[StablePaperEnderpearlLoading] ",bold:true,color:"light_purple"},{text:"Finished removing datapack resources from the world. You can now deleter the zip file from your world!",color:"dark_purple"}]
datapack disable "file/StablePaperEnderpearlLoading-Mc26.2-v2.zip"

# Step 4:
# MANUAL ACTION: You now have to manually delete the datapack file from the world save.