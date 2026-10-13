# StablePaperEnderpearlLoading
A Minecraft 26.2 datapack that makes enderpearl loading and the time for which a chunk remains loaded after the pearl is gone stable (works on paper!).


# FAQ
### What does this datapack do?
The simple version: Paper servers have settings that can affect enderpearl loading, including one that determins how long that chunk should stay loaded once all pearls, players and other loading entities leave the chunk. However, it is very unreliable, especially the setting that keeps chunks loaded for a while. This can break machines that rely on detecting pearls dissapearing and/or reappearing or force you to build portal chunkloaders for them (which load multiple times as many chunks and isnt great for server performance on large scales). This pack makes sure chunks with pearl stasis chambers are reliably loaded.

The technical version: Whenever a player throws a pearl, the pack checks if the chunk the pearl is in is already being loaded by the datapack. If it is, nothing happens, but if it's not the pack will spawn a ChunkController (marker entity) and forceload that one chunk. The controller has a default lifespan of 10 seconds that ticks down every game tick (can be changed). The controller continuously checks to make sure there are still enderpearls present in it's chunks. If it finds at least 1 pearl, the controller resets its lifespan. If it finds no pearls, it's lifespan will continue to go down and, once at 0, the controller will remove the forceloading from it's chunk and then it dies. From that point on a new pearl can create a new ChunkController for that chunk again. 

### Can you add X feature or fix X bug?
Bugs will have significantly higher odds then features, but you are free to report/request both by opening an issue on this repository.
Keep in mind that while I may release new builds for bugs mid version, features maight be left to be added in the next game version update.

### Can i safely remove this datapack after use?
Yes, just do it properly. To prevent a lot of force loaded chunks remaining, markers hanging around and scoreboard objectives cluttering your world file run this:
```/function pearl_loader:admin/remove_datapack```

### How do change the time a chunk remains loaded after all pearls dissapear from the chunk?
You can achieve this by altering a scoreboard objective for the datapack's fake player. Please, DO NOT alter any scoreboard objective other than this one or you will break the datapack! Simply take the amount of seconds you want the chunk to remain loaded and multiply it by 20 (the timer counts in gameticks) then run the following command, substituting the number 200 by your desired number: ```/scoreboard players set #EPLscores epl_unloaddelay 200```. Note: The minimum delay is 2 gameticks for technical reasons. Setting the score lower won't break the datapack, in such instance the pack will automatically set the delay to 2.

