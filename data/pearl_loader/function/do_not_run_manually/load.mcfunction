# Create neccesary scoreboard objectives
scoreboard objectives add epl_age dummy
scoreboard objectives add epl_x dummy
scoreboard objectives add epl_z dummy
scoreboard objectives add epl_two dummy
scoreboard objectives add epl_unloaddelay dummy

# Set Scoreboard defaults (unload delay is in gameticks, 200 equals 10 seconds)
scoreboard players set #EPLscores epl_x 16
scoreboard players set #EPLscores epl_z 16
scoreboard players set #EPLscores epl_two 2
scoreboard players set #EPLscores epl_unloaddelay 200

# Notify the loading has finished
tellraw @a ["",{text:"[StablePaperEnderpearlLoading] ",bold:true,color:"light_purple"},{text:"Loading succesfull!",color:"dark_purple"}]