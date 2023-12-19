# Day 5: If You Give A Seed A Fertilizer

# Init --------------------------------------------------------------------
library(tidyverse)


# Data --------------------------------------------------------------------
test1 = "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"

data = "seeds: 104847962 3583832 1212568077 114894281 3890048781 333451605 1520059863 217361990 310308287 12785610 3492562455 292968049 1901414562 516150861 2474299950 152867148 3394639029 59690410 862612782 176128197

seed-to-soil map:
2023441036 2044296880 396074363
2419515399 3839972576 454994720
274688417 699823315 258919718
533608135 0 431744151
965352286 431744151 161125324
3391658630 2936663910 903308666
200749950 1177785526 73938467
2874510119 1440389999 315892137
1916089471 2440371243 20593195
0 977035576 200749950
1936682666 1957538510 86758370
1440389999 2902130623 34533287
1126477610 592869475 106953840
3190402256 1756282136 201256374
1474923286 2460964438 441166185
1233431450 958743033 18292543

soil-to-fertilizer map:
1479837493 1486696129 480988794
3637384566 3730606485 267472485
70483107 174821741 921411492
3586173142 3071290434 51211424
1960826287 1166716340 319979789
3952751562 3398939385 283772589
0 1096233233 70483107
1166716340 1967684923 313121153
3904857051 3682711974 47894511
2902018973 3122501858 276437527
991894599 0 174821741
3416901681 2902018973 169271461
3178456500 3998078970 238445181

fertilizer-to-water map:
4274676882 2765984054 20290414
3642266392 2324011621 382224743
3159410287 4157769177 137198119
3437898965 2786274468 204367427
2136710407 1497332580 94233249
4121681656 2706236364 59747690
2362529584 1912615374 411396247
4181429346 3961317447 93247536
270199336 152334204 473273308
1977000445 3853228854 108088593
2085089038 1304420652 51621369
1407624846 2990641895 345516575
908901118 638701782 307729932
3296608406 1356042021 141290559
743472644 625607512 13094270
2230943656 3721642926 131585928
0 946431714 270199336
2773925831 3336158470 385484456
4024491135 1815424853 97190521
756566914 0 152334204
1304420652 4054564983 103204194
1753141421 1591565829 223859024

water-to-light map:
139728365 0 27290780
4161521920 2345099742 65970280
3549264451 2411070022 15588060
846553766 4012820620 62155872
3276913175 3215861697 30588309
7256118 139495191 27523954
3653026602 3908255344 104565276
2007806695 3246450006 21131889
426542603 2677155019 292403006
3265259672 4167732422 11653503
2959802238 3267581895 77570040
2766290955 2562319792 114835227
779480399 3352881787 3460872
718945609 995514267 33385697
908709638 1675494216 164534584
1547970680 1643941067 31553149
1579523829 2009572806 335526936
782941271 2969558025 63612495
752331306 465171569 27149093
237284175 1454682639 189258428
3757591878 3724399189 59699158
2881126182 3784098347 78676056
1520219770 2426658082 27750910
3564852511 1366508548 88174091
2383999106 3681454004 42945185
4287237444 3345151935 7729852
2242562254 3649815914 31638090
3307501484 753751300 241762967
34780072 27290780 104948293
2028938584 3033170520 182691177
3037372278 237284175 227887394
3817291036 3356342659 5821939
0 132239073 7256118
1360895538 1266240382 51601463
3823112975 492320662 230498145
2274200344 1840028800 109798762
4053611120 2454408992 107910800
2426944291 1317841845 48666703
1073244222 3362164598 287651316
1457977942 1203998554 62241828
2591192365 1028899964 175098590
1412497001 3862774403 45480941
2475610994 4179385925 115581371
4227492200 1949827562 59745244
1915050765 4074976492 92755930
2211629761 722818807 30932493

light-to-temperature map:
3741602262 2758947303 142653736
628739598 2901601039 50811783
1842260329 1084521599 145122645
2990409993 3493390513 390865485
4190333929 4159289690 83510514
984282519 2952412822 202948629
1826968660 3155361451 15291669
1329953386 2288178120 328046945
830513455 3304469747 74190775
1187231148 2616225065 142722238
2705943734 836690664 247830935
3381275478 1332397059 281233458
679551381 605080109 150962074
1987382974 756042183 44013157
4159289690 4263923057 31044239
1772730322 3250231409 54238338
2549609472 2131843858 156334262
1658000331 3378660522 114729991
298584178 195831363 330155420
3662508936 525986783 79093326
4273844443 4242800204 21122853
2953774669 800055340 36635324
2031396131 1613630517 518213341
265644560 162891745 32939618
162891745 1229644244 102752815
904704230 3170653120 79578289

temperature-to-humidity map:
671484955 1144907174 532089323
1414132335 1960778188 125717021
2631474761 2586973888 1058655511
1991131055 744338927 221864400
2212995455 192320896 28611061
192320896 2186552402 224875394
2241895588 966203327 169532208
1744764149 431490014 67442815
1812206964 2106058626 80493776
516655377 1135735535 9171639
1559412773 1775426812 185351376
2622156499 2577655626 9318262
1203574278 220931957 210558057
3690130272 4094120212 156346211
3946017132 3645629399 348950164
525827016 598680988 145657939
1892700740 1676996497 98430315
3846476483 3994579563 99540649
2577655626 4250466423 44500873
1539849356 2086495209 19563417
2241606516 598391916 289072
417196290 498932829 99459087

humidity-to-location map:
547577859 2546258172 54451455
2564186976 3913248498 28610653
2460249359 129990669 103937617
257798579 3257354132 21143365
511274864 3365252234 24536388
412475023 3389788622 98799841
2843712442 3615348771 251219053
0 2984989380 24111266
1074541266 4051128852 126947592
3109497668 265707418 9056683
3268495430 1450483293 18654108
1298820860 954974424 392849235
1691670095 1469137401 93027519
3886041222 2131196811 39611681
2797706800 1347823659 46005642
3767841776 233928286 19835810
743957513 253764096 11943322
4068806743 3941859151 109269701
2754107115 1910801576 16288912
1223331059 2244121482 75489801
3118554351 1393829301 56653992
3094931495 3009100646 14566173
3991994741 893524279 61450145
692486724 2192650693 51470789
1008564686 2952439802 32549578
535811252 3603582164 11766607
1784697614 2698363640 44335967
755900835 2353038285 193219887
278941944 1777268497 133533079
3925652903 3488588463 66341838
3558101581 2742699607 209740195
949120722 3305808270 59443964
2624116446 0 129990669
1939852817 274764101 520396542
3175208343 2037909724 93287087
3287149538 2600709627 97654013
650681177 1562164920 41805547
3787677586 795160643 98363636
1829033581 1927090488 110819236
4053444886 3897886641 15361857
1201488858 2170808492 21842201
3384803551 1603970467 173298030
2770396027 3278497497 27310773
1041114264 2319611283 33427002
602029314 3554930301 48651863
2592797629 3866567824 31318817
24111266 3023666819 233687313"


# Part One: Description ---------------------------------------------------
# You take the boat and find the gardener right where you were told he would be: managing a giant "garden" that looks more to you like a farm.
# 
# "A water source? Island Island is the water source!" You point out that Snow Island isn't receiving any water.
# 
# "Oh, we had to stop the water because we ran out of sand to filter it with! Can't make snow with dirty water. Don't worry, I'm sure we'll get more sand soon; we only turned off the water a few days... weeks... oh no." His face sinks into a look of horrified realization.
# 
# "I've been so busy making sure everyone here has food that I completely forgot to check why we stopped getting more sand! There's a ferry leaving soon that is headed over in that direction - it's much faster than your boat. Could you please go check it out?"
# 
# You barely have time to agree to this request when he brings up another. "While you wait for the ferry, maybe you can help us with our food production problem. The latest Island Island Almanac just arrived and we're having trouble making sense of it."
# 
# The almanac (your puzzle input) lists all of the seeds that need to be planted. It also lists what type of soil to use with each kind of seed, what type of fertilizer to use with each kind of soil, what type of water to use with each kind of fertilizer, and so on. Every type of seed, soil, fertilizer and so on is identified with a number, but numbers are reused by each category - that is, soil 123 and fertilizer 123 aren't necessarily related to each other.
# 
# For example:
#   
#   seeds: 79 14 55 13
# 
# seed-to-soil map:
#   50 98 2
# 52 50 48
# 
# soil-to-fertilizer map:
#   0 15 37
# 37 52 2
# 39 0 15
# 
# fertilizer-to-water map:
#   49 53 8
# 0 11 42
# 42 0 7
# 57 7 4
# 
# water-to-light map:
#   88 18 7
# 18 25 70
# 
# light-to-temperature map:
#   45 77 23
# 81 45 19
# 68 64 13
# 
# temperature-to-humidity map:
#   0 69 1
# 1 0 69
# 
# humidity-to-location map:
#   60 56 37
# 56 93 4
# The almanac starts by listing which seeds need to be planted: seeds 79, 14, 55, and 13.
# 
# The rest of the almanac contains a list of maps which describe how to convert numbers from a source category into numbers in a destination category. That is, the section that starts with seed-to-soil map: describes how to convert a seed number (the source) to a soil number (the destination). This lets the gardener and his team know which soil to use with which seeds, which water to use with which fertilizer, and so on.
# 
# Rather than list every source number and its corresponding destination number one by one, the maps describe entire ranges of numbers that can be converted. Each line within a map contains three numbers: the destination range start, the source range start, and the range length.
# 
# Consider again the example seed-to-soil map:
#   
#   50 98 2
# 52 50 48
# The first line has a destination range start of 50, a source range start of 98, and a range length of 2. This line means that the source range starts at 98 and contains two values: 98 and 99. The destination range is the same length, but it starts at 50, so its two values are 50 and 51. With this information, you know that seed number 98 corresponds to soil number 50 and that seed number 99 corresponds to soil number 51.
# 
# The second line means that the source range starts at 50 and contains 48 values: 50, 51, ..., 96, 97. This corresponds to a destination range starting at 52 and also containing 48 values: 52, 53, ..., 98, 99. So, seed number 53 corresponds to soil number 55.
# 
# Any source numbers that aren't mapped correspond to the same destination number. So, seed number 10 corresponds to soil number 10.
# 
# So, the entire list of seed numbers and their corresponding soil numbers looks like this:
# 
# seed  soil
# 0     0
# 1     1
# ...   ...
# 48    48
# 49    49
# 50    52
# 51    53
# ...   ...
# 96    98
# 97    99
# 98    50
# 99    51
# With this map, you can look up the soil number required for each initial seed number:
# 
# Seed number 79 corresponds to soil number 81.
# Seed number 14 corresponds to soil number 14.
# Seed number 55 corresponds to soil number 57.
# Seed number 13 corresponds to soil number 13.
# The gardener and his team want to get started as soon as possible, so they'd like to know the closest location that needs a seed. Using these maps, find the lowest location number that corresponds to any of the initial seeds. To do this, you'll need to convert each seed number through other categories until you can find its corresponding location number. In this example, the corresponding types are:
# 
# Seed 79, soil 81, fertilizer 81, water 81, light 74, temperature 78, humidity 78, location 82.
# Seed 14, soil 14, fertilizer 53, water 49, light 42, temperature 42, humidity 43, location 43.
# Seed 55, soil 57, fertilizer 57, water 53, light 46, temperature 82, humidity 82, location 86.
# Seed 13, soil 13, fertilizer 52, water 41, light 34, temperature 34, humidity 35, location 35.
# So, the lowest location number in this example is 35.
# 
# What is the lowest location number that corresponds to any of the initial seed numbers?

# Part One ----------------------------------------------------------------

almanac <-  test1

seeds <- tibble("seeds" = as.numeric(flatten(str_split(str_extract(almanac, "(?<=seeds:\\s)(\\d+|\\s)*(?=\\n\\n)"), "\\s+"))))
seeds

parse_map <- function(data, map, divider = "\\n\\n") {
  pattern = paste0("(?<=", map, ":\\s)(\\d+|\\s)*(?=", divider, ")")
  return(tibble("tmp" = str_extract(almanac, pattern) |> str_split("\n") |> flatten()) |> 
    separate_wider_regex(
      tmp,
      patterns = c(
        dest_start = "\\d+",
        "\\s+",
        source_start = "\\d+",
        "\\s+",
        length = "\\d+"
      )
    ) |> 
    mutate(
      dest_start = as.numeric(dest_start),
      dest_end = dest_start + as.numeric(length) - 1,
      source_start = as.numeric(source_start),
      source_end = source_start + as.numeric(length) - 1,
      length = NULL
    ))
  
}
seed_to_soil_map <- parse_map(data, "seed-to-soil map")
soil_to_fertilizer_map <- parse_map(data, "soil-to-fertilizer map")
fertilizer_to_water_map <- parse_map(data, "fertilizer-to-water map")
water_to_light_map <- parse_map(data, "water-to-light map")
light_to_temperature_map <- parse_map(data, "light-to-temperature map")
temperature_to_humidity_map <- parse_map(data, "temperature-to-humidity map")
humidity_to_location_map <- parse_map(data, "humidity-to-location map", divider = "")

convert <- function(value, map) {
  res <- map |> 
    filter((value >= source_start) & (value <= source_end)) |> 
    reframe(
      converted = dest_start + (value - source_start)
    )
  if(nrow(res) > 0) {
    return(head(res, 1)[[1]])
  }
  return(value)
}

converted = tibble("seed" = seeds$seeds, "location" = NA )

for(i in 1:nrow(converted)){
  converted[i,]$location <- converted[i,]$seed |> 
      convert(seed_to_soil_map) |> 
      convert(soil_to_fertilizer_map) |> 
      convert(fertilizer_to_water_map) |> 
      convert(water_to_light_map) |> 
      convert(light_to_temperature_map) |> 
      convert(temperature_to_humidity_map) |> 
      convert(humidity_to_location_map)
}
converted |> 
  summarise(
    min = min(location)
  )
# 88151870


# Part Two: Description ---------------------------------------------------
# Everyone will starve if you only plant such a small number of seeds. Re-reading the almanac, it looks like the seeds: line actually describes ranges of seed numbers.
# 
# The values on the initial seeds: line come in pairs. Within each pair, the first value is the start of the range and the second value is the length of the range. So, in the first line of the example above:
#   
#   seeds: 79 14 55 13
# This line describes two ranges of seed numbers to be planted in the garden. The first range starts with seed number 79 and contains 14 values: 79, 80, ..., 91, 92. The second range starts with seed number 55 and contains 13 values: 55, 56, ..., 66, 67.
# 
# Now, rather than considering four seed numbers, you need to consider a total of 27 seed numbers.
# 
# In the above example, the lowest location number can be obtained from seed number 82, which corresponds to soil 84, fertilizer 84, water 84, light 77, temperature 45, humidity 46, and location 46. So, the lowest location number is 46.
# 
# Consider all of the initial seed numbers listed in the ranges on the first line of the almanac. What is the lowest location number that corresponds to any of the initial seed numbers?

# Part Two ----------------------------------------------------------------
almanac <-  data

seeds <- tibble("seeds" = flatten(almanac |> str_extract("(?<=seeds:\\s)(\\d+|\\s)*(?=\\n\\n)") |> 
  str_extract_all("\\d+\\s\\d+"))) |> 
  separate_wider_regex(
    seeds,
    patterns = c(
      start = "\\d+",
      "\\s+",
      length = "\\d+"
    )
  ) |> 
  mutate(
    start = as.numeric(start),
    end = start + as.numeric(length)-1,
    length = NULL
  )
seeds

seed_to_soil_map <- parse_map(data, "seed-to-soil map")
soil_to_fertilizer_map <- parse_map(data, "soil-to-fertilizer map")
fertilizer_to_water_map <- parse_map(data, "fertilizer-to-water map")
water_to_light_map <- parse_map(data, "water-to-light map")
light_to_temperature_map <- parse_map(data, "light-to-temperature map")
temperature_to_humidity_map <- parse_map(data, "temperature-to-humidity map")
humidity_to_location_map <- parse_map(data, "humidity-to-location map", divider = "")

# A map-vector so we can loop throuh the maps.
maps <- list(seed_to_soil_map,
          soil_to_fertilizer_map,
          fertilizer_to_water_map,
          water_to_light_map,
          light_to_temperature_map,
          temperature_to_humidity_map,
          humidity_to_location_map
          )

# And a reversed map-vector som we can translate locations to seeds.
r_maps = rev(maps)

# Translate seed to location
convert <- function(seed, maps) {
  value <- seed
  for(map in maps) {
    res <- map |> 
      filter((value >= source_start) & (value <= source_end)) |> 
      reframe(
        converted = dest_start + (value - source_start)
      )
    if(nrow(res) > 0) {
      value = res[[1]]
    } 
  }
  return(value)
}

# Translate location to seed (no validation is made to check wether the seed actually exists)
reverse <- function(location, maps) {
  value <- location
  for(map in maps) {
    res <- map |> 
      filter((value >= dest_start) & (value <= dest_end)) |> 
      reframe(
        converted = source_start + (value - dest_start)
      )
    if(nrow(res) > 0) {
      value = res[[1]]
    } 
  }
  return(value)
}

# Sampla 10 000 seeds per seed range
result <- tribble(~range, ~seed, ~location)
result
for(r in 1:nrow(seeds)) {
  m_loc = -1
  for(i in 1:10000) {
    r_seed <- floor(runif(n=1, min=seeds[r,]$start, max=seeds[r,]$end))
    l <- convert(r_seed, maps)
    if(m_loc < 0 | l < m_loc) {
      m_loc <- l
      result <- result |> add_row(range = r, seed = r_seed, location = m_loc)
    }
  }
}
result |> 
  arrange(location)
# Range 7 ser väldigt lovande ut!

result |> 
  filter(range == 7) |> 
  ggplot(aes(x = location, y = seed, color = range)) +
    geom_point()
# Det verkar finnas locations med låga värden, mellanvärden och höga värden men
# inte så mycket mellan.

# Sampla range 7 50 000 gånger...
r <- 7
result <- tribble(~range, ~seed, ~location)
result
m_loc = -1
for(i in 1:50000) {
  r_seed <- floor(runif(n=1, min=seeds[r,]$start, max=seeds[r,]$end))
  l <- convert(r_seed, maps)
  if(m_loc < 0 | l < m_loc) {
    m_loc <- l
    result <- result |> add_row(range = r, seed = r_seed, location = m_loc)
  }
}

result |> 
  arrange(location)
# Lägsta location i samplet är 2008968  

result |> 
  filter(location < 10000000) |> 
  ggplot(aes(x = location, y = seed)) +
  geom_point()


# Kör brute force från den det högsta location från samplet ner till noll, fast 
# utgå från location och översätt till seed!
seeds
for(l in 2008968:0) {
  s <- reverse(l, r_maps)
  if(seeds |> filter((s >= start) & (s <= end)) |> nrow() > 0) {
    print(paste0("Min location = ", l, " for seed = ", s))
  }
}

# Answer: 2008785

?seq_along
