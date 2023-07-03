#scoreboards
scoreboard objectives remove s.item_tubes.q
scoreboard objectives remove s.item_tubes.pd

#message
tellraw @s ["",{"text":"'Item Tubes' uninstalled. Please leave the world and delete the datapack. If you relog before deleting you will need to run this uninstall command again.","color":"red"}]