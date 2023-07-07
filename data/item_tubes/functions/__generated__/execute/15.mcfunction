#built using mc-build (https://github.com/mc-build/mc-build)

tp @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..2] ~ ~ ~
execute if entity @s[tag=0] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 0
execute if entity @s[tag=1] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 1
execute if entity @s[tag=2] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 2
execute if entity @s[tag=3] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 3
execute if entity @s[tag=4] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 4
execute if entity @s[tag=5] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 5
kill @e[type=minecraft:marker,tag=s.item_tubes.pipe_marker]