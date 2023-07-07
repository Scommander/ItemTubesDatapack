#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s s.item_tubes.pd matches 0 positioned ~ ~1 ~ run tp @s ~0.5 ~0.375 ~0.5
execute if score @s s.item_tubes.pd matches 1 positioned ~ ~-1 ~ run tp @s ~0.5 ~0.375 ~0.5
execute if score @s s.item_tubes.pd matches 2 positioned ~1 ~ ~ run tp @s ~0.5 ~0.375 ~0.5
execute if score @s s.item_tubes.pd matches 3 positioned ~-1 ~ ~ run tp @s ~0.5 ~0.375 ~0.5
execute if score @s s.item_tubes.pd matches 4 positioned ~ ~ ~1 run tp @s ~0.5 ~0.375 ~0.5
execute if score @s s.item_tubes.pd matches 5 positioned ~ ~ ~-1 run tp @s ~0.5 ~0.375 ~0.5
scoreboard players reset @s s.item_tubes.pd
scoreboard players reset @s s.item_tubes.q