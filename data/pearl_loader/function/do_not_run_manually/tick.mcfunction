# Validate all scoreboard objectives to make sure one wasnt accidentally set to an unusable value
function pearl_loader:do_not_run_manually/validate_scores

# Process every currently loaded Ender Pearl.
execute as @e[type=minecraft:ender_pearl] at @s run function pearl_loader:do_not_run_manually/pearl

# Age every controller after the pearl-refresh pass.
execute as @e[type=minecraft:marker,tag=pearl_chunk_controller] run function pearl_loader:do_not_run_manually/controller/tick
