function load {
    #scoreboards
    scoreboard objectives add s.item_tubes.q dummy
    scoreboard objectives add s.item_tubes.pd dummy
}

function tick {
    #20 tps
    execute as @e[type=minecraft:item] at @s if block ~ ~ ~ #item_tubes:glass run {
        #reset score
        scoreboard players set @s s.item_tubes.q 0
        #align item inside of glass
        execute align xyz run tp @s ~0.5 ~0.375 ~0.5

        #count possible blocks around
        #reset first
        scoreboard players set $adjacent_blocks s.item_tubes.q 0
        #each direction add score
        execute unless score @s s.item_tubes.pd matches 1 if blocks ~ ~ ~ ~ ~ ~ ~ ~1 ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
        execute unless score @s s.item_tubes.pd matches 0 if blocks ~ ~ ~ ~ ~ ~ ~ ~-1 ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
        execute unless score @s s.item_tubes.pd matches 3 if blocks ~ ~ ~ ~ ~ ~ ~1 ~ ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
        execute unless score @s s.item_tubes.pd matches 2 if blocks ~ ~ ~ ~ ~ ~ ~-1 ~ ~ all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
        execute unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~1 all run scoreboard players add $adjacent_blocks s.item_tubes.q 1
        execute unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~-1 all run scoreboard players add $adjacent_blocks s.item_tubes.q 1

        #delete motion
        data merge entity @s {Motion:[0d,0d,0d]}

        #randomise if necessary
        execute if score $adjacent_blocks s.item_tubes.q matches 2.. run {
            ## STEPS
            #: Summon markers in valid direction
            #: Teleport to random marker
            #: Kill markers

            tag @s add s.item_tubes.current_item

            #move up
            execute unless score @s s.item_tubes.pd matches 1 if blocks ~ ~1 ~ ~ ~1 ~ ~ ~ ~ all positioned ~ ~1 ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","0"]}
            #move down
            execute unless score @s s.item_tubes.pd matches 0 if blocks ~ ~-1 ~ ~ ~-1 ~ ~ ~ ~ all positioned ~ ~-1 ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","1"]}
            #move posx
            execute unless score @s s.item_tubes.pd matches 3 if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all positioned ~1 ~ ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","2"]}
            #move negx
            execute unless score @s s.item_tubes.pd matches 2 if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all positioned ~-1 ~ ~ align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","3"]}
            #move posz
            execute unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all positioned ~ ~ ~1 align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","4"]}
            #move posz
            execute unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all positioned ~ ~ ~-1 align xyz run summon minecraft:marker ~0.5 ~0.375 ~0.5 {Tags:["s.item_tubes.pipe_marker","5"]}

            execute as @e[type=minecraft:marker,tag=s.item_tubes.pipe_marker,distance=..2,sort=random,limit=1] at @s run {
                tp @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..2] ~ ~ ~
                execute if entity @s[tag=0] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 0
                execute if entity @s[tag=1] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 1
                execute if entity @s[tag=2] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 2
                execute if entity @s[tag=3] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 3
                execute if entity @s[tag=4] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 4
                execute if entity @s[tag=5] run scoreboard players set @e[type=minecraft:item,tag=s.item_tubes.current_item,distance=..0.1,limit=1] s.item_tubes.pd 5
                kill @e[type=minecraft:marker,tag=s.item_tubes.pipe_marker]
            }
            

            tag @s remove s.item_tubes.current_item
        }
        #straight ahead! (no randomisation required)
        execute if score $adjacent_blocks s.item_tubes.q matches ..1 run {
            #MOVE UP (CANT MOVE DOWN)
            #move up
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 1 if blocks ~ ~1 ~ ~ ~1 ~ ~ ~ ~ all positioned ~ ~1 ~ align xyz store success score @s s.item_tubes.q run {
                #MOVE UP
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 0
            }
            #move down
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 0 if blocks ~ ~-1 ~ ~ ~-1 ~ ~ ~ ~ all positioned ~ ~-1 ~ align xyz store success score @s s.item_tubes.q run {
                #MOVE DOWN
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 1
            }
            #move posx
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 3 if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all positioned ~1 ~ ~ align xyz store success score @s s.item_tubes.q run {
                #MOVE POS X
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 2
            }
            #move negx
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 2 if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all positioned ~-1 ~ ~ align xyz store success score @s s.item_tubes.q run {
                #MOVE NEG X
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 3
            }
            #move posz
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 5 if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all positioned ~ ~ ~1 align xyz store success score @s s.item_tubes.q run {
                #MOVE POS Z
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 4
            }
            #move posz
            execute unless score @s s.item_tubes.q matches 1 unless score @s s.item_tubes.pd matches 4 if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all positioned ~ ~ ~-1 align xyz store success score @s s.item_tubes.q run {
                #MOVE NEG Z
                tp @s ~0.5 ~0.375 ~0.5
                scoreboard players set @s s.item_tubes.pd 5
            }

            execute unless score @s s.item_tubes.q matches 1 align xyz run {
                #FINAL MOVE
                execute if score @s s.item_tubes.pd matches 0 positioned ~ ~1 ~ run tp @s ~0.5 ~0.375 ~0.5
                execute if score @s s.item_tubes.pd matches 1 positioned ~ ~-1 ~ run tp @s ~0.5 ~0.375 ~0.5
                execute if score @s s.item_tubes.pd matches 2 positioned ~1 ~ ~ run tp @s ~0.5 ~0.375 ~0.5
                execute if score @s s.item_tubes.pd matches 3 positioned ~-1 ~ ~ run tp @s ~0.5 ~0.375 ~0.5
                execute if score @s s.item_tubes.pd matches 4 positioned ~ ~ ~1 run tp @s ~0.5 ~0.375 ~0.5
                execute if score @s s.item_tubes.pd matches 5 positioned ~ ~ ~-1 run tp @s ~0.5 ~0.375 ~0.5
                scoreboard players reset @s s.item_tubes.pd
                scoreboard players reset @s s.item_tubes.q
            }
        }
    }
}