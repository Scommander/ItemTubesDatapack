#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add s.item_tubes.current_item
execute unless score @s s.item_tubes.pd matches 1 if blocks ~ ~1 ~ ~ ~1 ~ ~ ~ ~ all positioned ~ ~1 ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","0"]}
execute unless score @s s.item_tubes.pd matches 0 if blocks ~ ~-1 ~ ~ ~-1 ~ ~ ~ ~ all positioned ~ ~-1 ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","1"]}
execute unless score @s s.item_tubes.pd matches 3 if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all positioned ~1 ~ ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","2"]}
execute unless score @s s.item_tubes.pd matches 2 if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all positioned ~-1 ~ ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","3"]}
execute unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all positioned ~ ~ ~1 align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","4"]}
execute unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all positioned ~ ~ ~-1 align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","5"]}
execute as @e[type=minecraft:marker,tag=s.item_tubes.pipe_marker,distance=..2,sort=random,limit=1] at @s run function item_tubes:__generated__/execute/15
tag @s remove s.item_tubes.current_item