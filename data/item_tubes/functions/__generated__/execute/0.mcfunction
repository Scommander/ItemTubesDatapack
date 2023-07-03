#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set @s s.item_tubes.q 0
execute align xyz run tp @s ~0.5 ~0.375 ~0.5
scoreboard players set $adjacent_blocks s.item_tubes.q 0
execute unless score @s s.item_tubes.pd matches 1 if blocks ~ ~ ~ ~ ~ ~ ~ ~1 ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
execute unless score @s s.item_tubes.pd matches 0 if blocks ~ ~ ~ ~ ~ ~ ~ ~-1 ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
execute unless score @s s.item_tubes.pd matches 3 if blocks ~ ~ ~ ~ ~ ~ ~1 ~ ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
execute unless score @s s.item_tubes.pd matches 2 if blocks ~ ~ ~ ~ ~ ~ ~-1 ~ ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
execute unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~1 all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
execute unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~-1 all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
data merge entity @s {Motion:[0d,0d,0d]}
execute if score $adjacent_blocks s.item_tubes.q matches 2.. run function item_tubes:__generated__/execute/8
execute if score $adjacent_blocks s.item_tubes.q matches ..1 run function item_tubes:__generated__/execute/22