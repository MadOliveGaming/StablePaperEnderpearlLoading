# The pearl pass runs first each tick and sets this back to 200 when a pearl exists.
scoreboard players remove @s epl_age 1

# 200 ticks without a pearl: release the chunk, then remove the controller.
execute as @s at @s if score @s epl_age matches ..0 run function pearl_loader:controller/remove
