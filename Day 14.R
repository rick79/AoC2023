# Day 14: Parabolic Reflector Dish

# Init --------------------------------------------------------------------
library(tidyverse)
library(collections)

# Data --------------------------------------------------------------------
test1 <- "O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#...."

test2 <- "OOOO.#.O..
OO..#....#
OO..O##..O
O..#.OO...
........#.
..#....#.#
..O..#.O.O
..O.......
#....###..
#....#...."

data <- "..O...............O....O..O#.OO...O.O#...OO##O....#....O#.O#O....O#.......#.#OOO...O.......O##..#...
OO##.O..#..O..#.#........OO.....#...O.#.O..O...O..O.O...O..O....OOO.........#.#O.O....#..OO..#.##.O.
.#.O......O#.##..O..#...#..##.O......O.O#......O.O.OO..#.##.#OO.O..O.O..O#...O.O#.#O..O.#....O.O....
..#....O.#....O..O.OO#....#..#.OO...O..##OO###.#O#..#.O...#...#.O....O..#O#.O#..OO.#..O...#....O.O..
..#OO.O..###.....#.OOO...O....#OO.#..O.#.O.#.#.#O......O.O.O....O#O.O.O##.O..O..O..#.#O.#.O..O.O...O
..O...O.O##...#...O...##...#..O..........O#.#.OOO#.#..#.O......OO##........OO..O#...#.OO.....O.....#
.#.OO#.#O...#.OO....O.....O.O..O...#...O....O..#......###O..O..O#.....#.O..#O..#..O......#...O.....#
##....#O.#OO..#.......OO.....#..##....#..O#OO.#...OO.....O....#.....O#....O...OO#..#...#...O#...#.O#
...#...OO.O...O#.O.......#O....#..O..#.#.O.#.OOO.#..OOO.O#........##....#.O.O...#O..O.#OO.#OOO.O....
OO#.....O..#.#O....O...#..O.O...O..O.O#.........#O#OO..O.O....OO..OO...O...O...O.O....O....#..#..#..
O.#.O.#.....#...#.#........O..OO..O#O#O#.....#.#....O#..O.O......O.......#.....O...O...O.OO.O.O#...#
...#...O.#.#....O.OOO...#.##......OO.O...O....#.O#O..O....#..#..##.O...O....#...O..O.O.O........#OOO
.#.#......##O.OO.OO##.O...#.......O.#OO.##.#...O..#O..O.OO..O.O.O.#.O.O..#..O..#..#....OO..#..#.....
...#OO#.O....#O..O#.O..#.#.....#...#..O..O#O...........#...OO#O..O..#O...O.#..###.O.#......#...OO.O.
..#O....O.O#.O.O#.#.#...O....O.....O....#O........#OO.O#O#...O#.OO.O.....O.##..O.#...#.#.O...O#..#.#
.#..O#O...#O#.O.....O..#.#......O..OO.O.....O.....O.#.#O#.#O.O#.O###............##...O.....O.O.....#
.....O...#O#.#....O......##.#..#.##...#..O.O.O##....O..#...#O.O.....O..O#..#..O#...##...#...#OOO..O.
....O......OO##..O#O..O.....O#.#...O.#.O.#....#.OO.#OOO..#.O.O##.....O.O...#.....#.O.O....#...#.....
...O....#O....OO..#...#.O.......O.O....#.O......O..#.##O.....O...#O..#O#O.O#....#O..OO##..OO#....O.#
.#...#..#....O.....O.#OO.O..#...##...O.......O......#.O.#O..#..O....O..#........#...O...O###..O.....
#..#.O....O.#OOO##O#.##.O.#.#.#..#..O......#...OO.#..O...#....#....O...OO.#.OO...#.#........O......#
.....#O.#..###..O..#.#.#..#..#..O....#..#......#...O..#O....O....O.....OO.O#.......O..#....#...#..##
.#..#........#.#O#O...#...........O#....#.O.....#....#.##...#.O.O##..#O.#..O...#...##.O.##.O....O..O
...#.O...O...O........#...O..#.O.#.O.#....#OO......OO#.O.O##...##..OO#.#O.O.#..O....O......#....##..
.....#O..#.#.....#O#.#.#..#..O.........O.O.#...O...#OO#.....#.....O.O.#..##...OO...O...#OO.#........
....#.#..#O...O..#.O...O.OO......#O#.O##O.#..O..##.#O.O....O...##O..O...#.O..#O...##...O..O.#O....OO
...O..#....OO..O#.......#...........#..O.....O#OO#.O..O.O..#O...OOO..##OO........#..O.O##OO#...#O...
.O.......O.......O..O...###...O.....O.O.O#.#...O.O#..#O..#.O..OO....#O.....##...O...#O.#....O..#OO.O
##O#.O...OO.O.##.O...#....#..O.....OO.O....O#.O#.O..#....OO#.....OO..##.#......O.OO..#..#....#O..#O.
....#...#O....OO.....OO.O#.#.....#...O#O...#...#..OO..O##.O...O.O.O..........O.#.O#O....#O#...O.....
.....O.OO#OOO..##....##.....O#.......O#..#.#..OO...O..O...##...O..O.O#....OOO..#.OO........O..##..O.
.O.......#........#.....O.O...O...O.O...O..O....O#.....#.OO..O..#.##.#..#...#.#...O.#..##.......O...
.....O#....O.O.#..O.........O.O....###..O..OOO.O#..#..........#......OOOO.#O...O...O.O.....O.OOO##OO
#..#...........#....#...#.O..#...#O#...#...##.#....#O#.O#O......O#.#.#...O.O.#.O.#...O.O...OO.#....#
.O..O##....#..O.O..##.O.#..#........#..#.O.##...O...O....O.#...O...##..O#OO.#.#..O....O..##O...OO.O#
...O..#......#.#.......OO....#.....#......O.O....##O..OO.OO.#....##.O..O...........#OO...OO.O.O.OOO.
.........#.OO..O.O#....#.#..O...#.....O.O..............#.....OOOO.#..O.O#O.O.O...#..O.O.OO....O..#.O
O.........O##...#.....#....#.O......O.O.O.O..#.O#...O.OO.#.O.O.#.....O.O..OO#.#.#.O.#...#.....#....#
.OO.O.#O..O..#..O.O#.O..#O.#.#.OO.#O#OO..O.........O....#....#.O.O#.O.O.#...#..O...#..#.........O..O
OO..O......O#..#O..O.O.O..O...#..OO#.OO....#.OO.#O..O.O..#......#O.#....#...#.OOO....O.O.OO....#....
.O..#O#.......O....OO.O....#OO.O...O..#.....O#.O.OO.#..O..O.O#.....###O....#.....O.#.......O.....OO.
.O..O.O.##.OO..#.#.O...#...#.#..OOO..O.....#.#O#..OO.OOOO.#......O..#....O.#.O.#....#.....O...#..OO.
.#.#...OO..O....O.....O..##.#.#O#...#.....#..O.#......O.O##..#......O##..O.O...#O.#.O...........#O..
.OOO#....#..#O##..#.....O.OO#..O..#.##....OO..OO....#.##.#...#...O#O.....O#.#.#.O......#O...#.....#.
....O##....#...###O.OO..#...#.O.OO#O..O.O..##......O....#....#..O###..#..#.....O.......#..O.O#......
O.O...........O.#...OO.O.......#.....O...##.#..#.O#..#...#.O##..#O.##...O.....O...OOO.O.O..#OOO....#
.O.O#O...O...#...............OO#......O........##OO.......O...#OO.O..O....O..###.O..O...O...O.#.....
.O.##OO.........OO.OO..O..OO.#..#.#......O..O#O.O..##..O..O.##.....O#O.O...OO...O###..O......#.O....
#.O...O.O.O..O#..O.O......O.#.....O.O...#.#O.O..O.......O....#.....O#OO..O..O.O...O##..O.......#....
OOO...##...#..#.OO#O..O#.O.....O........O#....#.#.....O#.OOOO...#OOO...OO..OOO...O#........O...#....
#....#....#.....#....O.O..O.O...##.#..O##.#O.#.O.##O.............###..#O#O.O#..#........#.#O#....#..
O.#.#.OO.....#.##....OO...##..OO.#.......#O...O#............#O#O#....O..#......#......O#.OOO.O##..O.
....O....O.#O...#OO#...#.O....#.OO.O...##.O.O.O....OO#O.#....O.....O..#..O.#.O##O##....#..#..#.O.O..
###....#..#...OOO##O.O.#..#..O#......O....#.#.#OO.O....O.OOO..#...#O.##.#......OO.....O..#.O...#OO..
.#...O...O....OO.....O..O#..O.O.O.#.....#OO#O....O...OO..#..O.O.O.#..#O......##.....#.....#O.O......
.OOO........O.#.#....#OO..#.O.O...#.....#OO......O.....#......#.##.O.OO.....#O.#O..O.O....#...O.##.#
#O.O#..#..#...O.O#...O##..#..OOO....OO.#....#.O#OO.#..OO#.#OOO##OO.....O.O.O.....O...###O..O#O....#.
###...O..O.OO.#...#.O.O#O.OO..##O.OO..#..O...#.......#.......#.....#..#.#..O..#.OO....O..O..OO...#O.
OO...#OO.#....#.O.O.O..O....#O..#..O.O.O.#.......O......O.O.O.....O...O.OO#OO.......O..#.......#O...
.#OO.......O..OO.#O.#OO...#OO..O..O.#...O.O....O....#O#..OOO.#........#.O.O...#...O#.O...O.#.#....O.
#OO##.O...O....##..#....O.#..#.....##..O....#O...#......#O#.O..O.##.....O.O...#O.#OO.###O..#..O#O..#
.#...#.....O#.#....O.OO##.O.O..O........O##....#.O#O#.....##...O..O#.#....O.#...##...#..#O....O....O
..O..O....#..#....#..#.#.#O#........O..#.....O.###.#O...O...O##..O.O..#.#.O..#...OO.O.OOO.......#...
..OO##O.O..OO.O..#.#...O..O.#..O#..O#...#...O.O....#..O...O.#..#.#...O..OO..........O...O.O......O..
..#..#.#..O#.........O.......#.....#..#.....O#..#O.....OO..#...O#O.O#....#..O#....O..#O....O...O....
O..O..O.....#..#...O...#O.....O.OO..O....O.O....##..O.#OOO..#.#.O.O#......#.OOO..O.O.....#..#.......
....#.O.O.#.#..O#.....#..O##O..#..#.#....##O.....O##.#....O........O##...##OO...O#.#.O..O#O..#..O...
...#O.....O..##.#....O.OO.O...##..O........O..O.#.#........OO..OO...OO##...#....#...OO#..#O.O.......
##O..#OO....O..O#.O.O.#.OO.#O#.......#....O...#........O...#..O..OO#..O.....#...O...#....#..........
...##OO.O...#..#O...OO...#.OO.....O.O...OO..O#.........O...O....O#O#.O.#...OO...##O.#.#.O....O#..#..
#.....#...O.O.O...O#..#...OO.OO...O..##.#.......#.##OO...........O...O...##..OO..O..#.....#.O...OO..
..O.O...O#.OO#......OO..O#....O.O...#O.#.........O...#OO....O.O.O.#O........#.##.......#....##...#..
#.#...OO..#O..O.....OO###OOO........O.O.O....O#O#O#.O.....O#O..##.##O...O###....####.O..#..##....##O
..#..O.#.O.#.#...O.......O....O...OOOO...#.OO#....#.......O..O.........#..O.O.........#.O..O..O.O..#
#..OO...##.O.#.#..#...O.........#O.#.......#O....#..#O.#...O.O..##OOOO..#.#..........O..O.O.####..#.
#...O..#....#O..O#O#O.......O..O..O...O...OO.OO.OO.O..#.#.#OO#.#OO.#O........O..O.O.....OO.#O.#..O.#
..O.#...........O..OO......#OOO#...O#O#O......#......OO..O......O#..#.OOOO...O........#..#.OOO...#O.
O.##...#OO....OOO...O....O.....OO...##....#...#O.O..#..O#O....O#....O....##......OOO.O..#...O#OOOO..
...O.....O.O.#.#...OOO#OOO.O.....O#OOO#.#O...O#OO.O...#...O......OO.....O...#.O.#..##....#..O...OOO.
.#...O.....#..O......O...#.....##..O#.#O..O....O..#....O......##..#OO..O.##..#O....O......#.O.#OOO.O
.#...O...OO.....#.O..#OOO#.O....O.O...........#...O.....OO.##.#......O.O....#.O.##O....##......O....
.OO.....#O.##.##...#....#....OO.O...#.......OOO#..OO..O.O......#....#O...###.O..#.##.#.#..O.#...O...
....O.....OO..O##.O...#O##.O.#.OO.OO.O........#O............#OO.O#O.#.O##.##...........#..O.#O.O.#OO
..O..O...#O....O#..O.O..O..OOO..O..#.#.OO..#O#.#...O....#.O.#...#....##.....##O...#O##..O#.....#O...
O#.....O...#..##OO..O#O........#.#...#O...O#......#O..##.#O...O.O....OO..O.OOOO...#O.O.O....#OO.O.#.
.OO.....##..#...#.#....O...O...O...O..OO....#O..##O...O.#.OO.O##....#..O.OO.....O..##.O#.....#O..O#.
O.....O.O..#...O..#.#.OO...O..O#.#O..#O.#.#.##..#.O.OO##..O...#.#.O...##.O....O...OO...O#O..O.O.##O#
.#.O........##..........#...O...#O..O..#..O....OO.OO.#..O.O##.#...#.O#.O...##.O#...#....O......#..O.
O#O.OOO..##OO.#........#O.#O...OO...#.OO.........O.#.........#..#.....O.O...#..O#O.OO..O..O....O#...
.O#..O#...#O...O.O..O#...O.#.O.O....##O....O....##OO....O..O.#O.O....##.#O.....OO..#O..O....#OO...#.
O..........O.O.........#O...#...#..##........O.#......O#..O#.......O...O...#O....#.##......O.#.#.O.O
....O...#OO..O.O.....OO.#.#O.#........#O.O...#..#.....O...O.....OO...#.OO..##.O.#......#...#.O#..#..
...O..#.#...#.#..#..#...OO.#........##..O.O..#....#..O...O......#..O.......##....O............O.#..#
..O#.O.###........#.#.#...#.O.#O#O.O.O..O.O#O.....#O.O.O...O##O.....OO.O..O..#......O....O..#O......
#..O...O....OO.O.......O.......#..#O.#...O.###.....OO..O..O..OO.O#..#O.#OO.O#.O.O.O.O..O#...###O....
#....##O..O.#...O...#O....O#O#........#..#........###...##..O...O...OO.#.OO#..##..OOO......O.O.#.O#.
...OO.O........O...O..OO...O.O#O...O#.O.#.........O.O.......O.#....O...O..#.OO#..OOO...O.#..OO....O.
#O.OO.OO.##.#O...O.......#O.#O....O.#..O.......OOO...O#...##O##.#.......OO#O.....OO.OO#.O#O#O#....#.
....OO#OO...#........OO#...#..O....#.O..O...O.O.OO......O.#OO....#..#...........O...##..O..O.O......
#...O.O..O.##.......O.......O....O.O..#..#O...O.....OOO.#.O.....##..O..#O.......#..O..O.O.....O#OO.O"

# Part One: Description ---------------------------------------------------
# You reach the place where all of the mirrors were pointing: a massive 
# parabolic reflector dish attached to the side of another large mountain.
# 
# The dish is made up of many small mirrors, but while the mirrors themselves 
# are roughly in the shape of a parabolic reflector dish, each individual mirror 
# seems to be pointing in slightly the wrong direction. If the dish is meant to 
# focus light, all it's doing right now is sending it in a vague direction.
# 
# This system must be what provides the energy for the lava! If you focus the 
# reflector dish, maybe you can go where it's pointing and use the light to fix 
# the lava production.
# 
# Upon closer inspection, the individual mirrors each appear to be connected via 
# an elaborate system of ropes and pulleys to a large metal platform below the 
# dish. The platform is covered in large rocks of various shapes. Depending on 
# their position, the weight of the rocks deforms the platform, and the shape of 
# the platform controls which ropes move and ultimately the focus of the dish.
# 
# In short: if you move the rocks, you can focus the dish. The platform even has 
# a control panel on the side that lets you tilt it in one of four directions! 
# The rounded rocks (O) will roll when the platform is tilted, while the 
# cube-shaped rocks (#) will stay in place. You note the positions of all of the 
# empty spaces (.) and rocks (your puzzle input). For example:
#   
#   O....#....
#   O.OO#....#
#   .....##...
#   OO.#O....O
#   .O.....O#.
#   O.#..O.#.#
#   ..O..#O..O
#   .......O..
#   #....###..
#   #OO..#....
#
# Start by tilting the lever so all of the rocks will slide north as far as 
# they will go:
#     
#   OOOO.#.O..
#   OO..#....#
#   OO..O##..O
#   O..#.OO...
#   ........#.
#   ..#....#.#
#   ..O..#.O.O
#   ..O.......
#   #....###..
#   #....#....
#
# You notice that the support beams along the north side of the platform are 
# damaged; to ensure the platform doesn't collapse, you should calculate the 
# total load on the north support beams.
# 
# The amount of load caused by a single rounded rock (O) is equal to the number 
# of rows from the rock to the south edge of the platform, including the row the 
# rock is on. (Cube-shaped rocks (#) don't contribute to load.) So, the amount 
# of load caused by each rock in each row is as follows:
#   
# OOOO.#.O.. 10
# OO..#....#  9
# OO..O##..O  8
# O..#.OO...  7
# ........#.  6
# ..#....#.#  5
# ..O..#.O.O  4
# ..O.......  3
# #....###..  2
# #....#....  1
#
# The total load is the sum of the load caused by all of the rounded rocks. In 
# this example, the total load is 136.
# 
# Tilt the platform so that the rounded rocks all roll north. Afterward, what 
# is the total load on the north support beams?
#   
#   




# Part One ----------------------------------------------------------------
#
# A easy problem today. Tried a few variations of the functions just for fun.
#
platform <- data |> 
  str_split_1("\n") |> 
  str_split("") |> 
  {\(x) unlist(x) |> 
      matrix(ncol = length(x), byrow = TRUE)}()

total_load <- function(p) { sum(nrow(p) - which(p == "O", arr.ind = TRUE)[, "row"]+1) }

rotate_cw <- function(m) { t(apply(m, 2, rev)) }

tilt <- function(p) {
  for(y in 2:nrow(p)) {
    for(x in 1:ncol(p)) {
      if(p[y, x] == "O") {
        if(all(p[1:(y - 1), x] == ".")) {
          p[1, x] <- "O"
          p[y, x] <- "."
        } else {
          dy <- first(which(cumsum(p[(y - 1):1, x] != ".") == 1)) - 1
          if(dy >= 1) {
            p[y - dy, x] <- "O"
            p[y, x] <- "."
          }
        }
      }
    }
  }
  return(p)
}

p <- tilt(platform)  
total_load(p)

# Answer: 107951

# Part Two: Description ---------------------------------------------------
# The parabolic reflector dish deforms, but not in a way that focuses the beam. 
# To do that, you'll need to move the rocks to the edges of the platform. 
# Fortunately, a button on the side of the control panel labeled "spin cycle" 
# attempts to do just that!
# 
# Each cycle tilts the platform four times so that the rounded rocks roll north, 
# then west, then south, then east. After each tilt, the rounded rocks roll as 
# far as they can before the platform tilts in the next direction. After one 
# cycle, the platform will have finished rolling the rounded rocks in those four 
# directions in that order.
# 
# Here's what happens in the example above after each of the first few cycles:
#   
# After 1 cycle:
# .....#....
# ....#...O#
# ...OO##...
# .OO#......
# .....OOO#.
# .O#...O#.#
# ....O#....
# ......OOOO
# #...O###..
# #..OO#....
# 
# After 2 cycles:
# .....#....
# ....#...O#
# .....##...
# ..O#......
# .....OOO#.
# .O#...O#.#
# ....O#...O
# .......OOO
# #..OO###..
# #.OOO#...O
# 
# After 3 cycles:
# .....#....
# ....#...O#
# .....##...
# ..O#......
# .....OOO#.
# .O#...O#.#
# ....O#...O
# .......OOO
# #...O###.O
# #.OOO#...O
#
# This process should work if you leave it running long enough, but you're still 
# worried about the north support beams. To make sure they'll survive for a 
# while, you need to calculate the total load on the north support beams after 
# 1000000000 cycles.
# 
# In the above example, after 1000000000 cycles, the total load on the north 
# support beams is 64.
# 
# Run the spin cycle for 1000000000 cycles. Afterward, what is the total load on 
# the north support beams?
#

# Part Two ----------------------------------------------------------------

#  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
#        [                 ]  [  4  5  6  7  8  ]  [  4  5  6
#        1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18
#        [                 ]  [                 ]  [
#        f                    s                             m
# f = First occurrence of a state
# s = Second occurence of a state
# m = Max cycles
#
# ((20 - 3) %% (10 - 3)) + 3 => ((m - f) %% (s - f)) + f
#


p <- platform
seen <- dict()  # Dict to avoid having to loop through a list to check if a state has occured before
state <- list() # List to store states, so we can avoid having to redo the last calculations of an incomplete pattern cycle.
seen$set(p, 0)  # We have always seen the start state, not that we need it but anyhow
seen$get(p)
max_c <- 1000000000
for(c in 1:max_c) {
  print(c)
  p <- p |> 
    tilt() |> 
    rotate_cw() |> 
    tilt() |> 
    rotate_cw() |> 
    tilt() |> 
    rotate_cw() |> 
    tilt() |> 
    rotate_cw()
  if(seen$has(p)) {
    seen_c <- seen$get(p)    
    i <- ((max_c - seen_c) %% (c - seen_c)) + seen_c
    # print(paste0("The same configuration seen at cycle: ", c))
    # print(paste0("Last seen at cycle: ", seen_c))
    print(paste0("The answer is: ", total_load(state[[i]])))
    break
  } else {
    seen$set(p, c)
    state <- append(state, list(p))
  }
}

# Answer: 95736




# Old stuff ---------------------------------------------------------------

total_load2 <- function(p) {
  t_load <- 0
  for(y in 1:nrow(p)) {
    for(x in 1:ncol(p)) {
      if(p[y, x] == "O") {
        t_load <- t_load + nrow(p) - y + 1
      }
    }
  }
  return(t_load)
}

total_load3 <- function(p) {
  t_load <- 0
  p_rows <- nrow(p)
  o_rocks <- which(p == "O", arr.ind = TRUE)
  for(i in o_rocks[, "row"]) {
    t_load <- t_load + (p_rows - i + 1)
  }
  return(t_load)
}

tilt2 <- function(p, direction = 0) {  # 0 = Nord, 1 = Väst, 2 = Syd, 3 = Öst
  if(direction > 0) {
    for(i in 1:(direction %% 4)) {
      p <- rotate(p)
    }
  }
  p_cols <- ncol(p)
  p_rows <- nrow(p)
  for(y in 2:p_rows) {
    for(x in 1:p_cols) {
      if(p[y, x] == "O") {
        #print(paste0("Found a ", p[y, x], " at y = ", y, ", x = ", x, ". Moving upwards"))
        stop <- 1
        for(dy in (y-1):1) {
          if(p[dy, x] != ".") {
            #print(paste0("-Stopping for a ", p[dy, x], " at y = ", dy+1, ", x = ", x))
            stop <- dy+1
            break
          }
        }
        if(stop == 1) {
          #print("-Reached the top, stopping")
        }
        if(stop != y) {
          p[stop, x] <- "O"
          p[y, x] <- "."
        } else {
          #print("Didn't move?")
        }
      }
    }
  }
  if(direction > 0) {
    for(i in 1:(4 - (direction %% 4))) {
      p <- rotate(p)
    }
  }
  return(p)
}

