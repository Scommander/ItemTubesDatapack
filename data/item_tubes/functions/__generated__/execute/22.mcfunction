#built using mc-build (https://github.com/mc-build/mc-build)

execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 1 if blocks ~ ~1 ~ ~ ~1 ~ ~ ~ ~ all positioned ~ ~1 ~ align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/23
execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 0 if blocks ~ ~-1 ~ ~ ~-1 ~ ~ ~ ~ all positioned ~ ~-1 ~ align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/24
execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 3 if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all positioned ~1 ~ ~ align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/25
execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 2 if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all positioned ~-1 ~ ~ align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/26
execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all positioned ~ ~ ~1 align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/27
execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all positioned ~ ~ ~-1 align xyz store success score @s s.item_tubes.q run function item_tubes:__generated__/execute/28
execute unless score @s s.item_tubes.q matches 1 align xyz run function item_tubes:__generated__/execute/29