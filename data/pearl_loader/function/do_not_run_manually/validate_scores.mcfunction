# Check if the unloaddelay set by the user is at least 2 ticks and, if it's not, it sets it to that value.
# Having a delay of less then 2 ticks might cause repeated force unloading and loading due to markers reaching 0 when a 
# pearl is still present in the chunk.
execute if score #EPLscores epl_unloaddelay < #EPLscores epl_two run scoreboard players set #EPLscores epl_unloaddelay 2