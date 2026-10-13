# Tick down the age score of the current controller by one (will be reset elsewhere the same gametick if the pearl is still here and we didnt reach 0)
scoreboard players remove @s epl_age 1

# If we reached age 0, the pearl was gone for the chosen amount of delay and we can remove the controller and unload the chunk
execute as @s at @s if score @s epl_age matches ..0 run function pearl_loader:do_not_run_manually/controller/remove
