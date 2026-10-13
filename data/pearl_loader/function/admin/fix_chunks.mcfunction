# This function is only for manual use!

# This function is intended to fix issues with forceloaded chunks not behaving. Use this when:
# - Chunks have pearls but are not loaded properly
# - Chunks are forceloaded while the controller already expired
#
# WARNING: Removes the forceloading of ALL chunks, including ones you might have manually forceloaded without the use of this datapack!
# If your paper settings stop pearl loading alltogether this function might not properly reload all the chunks with existing pearls!

kill @e[type=minecraft:marker,tag=pearl_chunk_controller]
forceload remove all
execute as @e[type=minecraft:ender_pearl] at @s run function pearl_loader:do_not_run_manually/pearl
tellraw @s ["",{text:"[StablePaperEnderpearlLoading] ",bold:true,color:"light_purple"},{text:"Chunk repair has finished!",color:"dark_purple"}]