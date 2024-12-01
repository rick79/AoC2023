# Day 20: Pulse Propagation

# Init --------------------------------------------------------------------
library(tidyverse)
library(collections)
library(pracma) # For Lcm

# Data --------------------------------------------------------------------

test1 <- "broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a"

test2 <- "broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output"

data <- "%qm -> mj, xn
&mj -> hz, bt, lr, sq, qh, vq
%qc -> qs, vg
%ng -> vr
%qh -> sq
&bt -> rs
%hh -> qs, bx
%gk -> cs, bb
%js -> mj
%pc -> mj, mr
%mb -> rd, xs
%tp -> qs, ks
%xq -> tp, qs
%bx -> sz
%mn -> cs, md
%cv -> rd
%rh -> rd, sv
%md -> cs
%pz -> mj, vq
%bz -> rd, hk
%jz -> vk
%sz -> jz
%lr -> pz, mj
%xs -> cv, rd
%kl -> rd, mb
%hz -> pc
%hk -> rz, rd
%vk -> qc
%bh -> zm
%vq -> qm
%ks -> qs, nd
&qs -> dl, jz, bx, vk, vg, hh, sz
&dl -> rs
%lf -> rh, rd
&fr -> rs
%xn -> mj, qh
%hf -> qs, xq
%sv -> rd, ng
&rs -> rx
&rd -> ng, fr, rz, lf, vr
%cj -> ss, cs
broadcaster -> hh, lr, bp, lf
%zs -> cs, mn
%vr -> bz
%nd -> qs
%jb -> cj, cs
&rv -> rs
%bp -> cs, lx
%ss -> zs
%lx -> gk
&cs -> lx, ss, rv, bh, bp
%bb -> bh, cs
%mf -> mj, hz
%zm -> cs, jb
%mr -> mj, js
%rz -> kl
%vg -> hf
%sq -> mf"

# Part One: Description ---------------------------------------------------
# With your help, the Elves manage to find the right parts and fix all of the 
# machines. Now, they just need to send the command to boot up the machines and 
# get the sand flowing again.
# 
# The machines are far apart and wired together with long cables. The cables 
# don't connect to the machines directly, but rather to communication modules 
# attached to the machines that perform various initialization tasks and also 
# act as communication relays.
# 
# Modules communicate using pulses. Each pulse is either a high pulse or a low 
# pulse. When a module sends a pulse, it sends that type of pulse to each module 
# in its list of destination modules.
# 
# There are several different types of modules:
# 
# Flip-flop modules (prefix %) are either on or off; they are initially off. If 
# a flip-flop module receives a high pulse, it is ignored and nothing happens. 
# However, if a flip-flop module receives a low pulse, it flips between on and 
# off. If it was off, it turns on and sends a high pulse. If it was on, it turns 
# off and sends a low pulse.
# 
# Conjunction modules (prefix &) remember the type of the most recent pulse 
# received from each of their connected input modules; they initially default to 
# remembering a low pulse for each input. When a pulse is received, the 
# conjunction module first updates its memory for that input. Then, if it 
# remembers high pulses for all inputs, it sends a low pulse; otherwise, it 
# sends a high pulse.
# 
# There is a single broadcast module (named broadcaster). When it receives a 
# pulse, it sends the same pulse to all of its destination modules.
# 
# Here at Desert Machine Headquarters, there is a module with a single button on 
# it called, aptly, the button module. When you push the button, a single low 
# pulse is sent directly to the broadcaster module.
# 
# After pushing the button, you must wait until all pulses have been delivered 
# and fully handled before pushing it again. Never push the button if modules 
# are still processing pulses.
# 
# Pulses are always processed in the order they are sent. So, if a pulse is sent 
# to modules a, b, and c, and then module a processes its pulse and sends more 
# pulses, the pulses sent to modules b and c would have to be handled first.
# 
# The module configuration (your puzzle input) lists each module. The name of 
# the module is preceded by a symbol identifying its type, if any. The name is 
# then followed by an arrow and a list of its destination modules. For example:
# 
# broadcaster -> a, b, c
# %a -> b
# %b -> c
# %c -> inv
# &inv -> a
#
# In this module configuration, the broadcaster has three destination modules 
# named a, b, and c. Each of these modules is a flip-flop module (as indicated 
# by the % prefix). a outputs to b which outputs to c which outputs to another 
# module named inv. inv is a conjunction module (as indicated by the & prefix) 
# which, because it has only one input, acts like an inverter (it sends the 
# opposite of the pulse type it receives); it outputs to a.
# 
# By pushing the button once, the following pulses are sent:
# 
# button -low-> broadcaster
# broadcaster -low-> a
# broadcaster -low-> b
# broadcaster -low-> c
# a -high-> b
# b -high-> c
# c -high-> inv
# inv -low-> a
# a -low-> b
# b -low-> c
# c -low-> inv
# inv -high-> a
#
# After this sequence, the flip-flop modules all end up off, so pushing the 
# button again repeats the same sequence.
# 
# Here's a more interesting example:
#   
# broadcaster -> a
# %a -> inv, con
# &inv -> b
# %b -> con
# &con -> output
#
# This module configuration includes the broadcaster, two flip-flops (named a 
# and b), a single-input conjunction module (inv), a multi-input conjunction 
# module (con), and an untyped module named output (for testing purposes). The 
# multi-input conjunction module con watches the two flip-flop modules and, if 
# they're both on, sends a low pulse to the output module.
# 
# Here's what happens if you push the button once:
#   
# button -low-> broadcaster
# broadcaster -low-> a
# a -high-> inv
# a -high-> con
# inv -low-> b
# con -high-> output
# b -high-> con
# con -low-> output
#
# Both flip-flops turn on and a low pulse is sent to output! However, now that 
# both flip-flops are on and con remembers a high pulse from each of its two 
# inputs, pushing the button a second time does something different:
#   
# button -low-> broadcaster
# broadcaster -low-> a
# a -low-> inv
# a -low-> con
# inv -high-> b
# con -high-> output
#
# Flip-flop a turns off! Now, con remembers a low pulse from module a, and so it 
# sends only a high pulse to output.
# 
# Push the button a third time:
#   
# button -low-> broadcaster
# broadcaster -low-> a
# a -high-> inv
# a -high-> con
# inv -low-> b
# con -low-> output
# b -low-> con
# con -high-> output
#
# This time, flip-flop a turns on, then flip-flop b turns off. However, before b 
# can turn off, the pulse sent to con is handled first, so it briefly remembers 
# all high pulses for its inputs and sends a low pulse to output. After that, 
# flip-flop b turns off, which causes con to update its state and send a high 
# pulse to output.
# 
# Finally, with a on and b off, push the button a fourth time:
#   
# button -low-> broadcaster
# broadcaster -low-> a
# a -low-> inv
# a -low-> con
# inv -high-> b
# con -high-> output
#
# This completes the cycle: a turns off, causing con to remember only low pulses 
# and restoring all modules to their original states.
# 
# To get the cables warmed up, the Elves have pushed the button 1000 times. How 
# many pulses got sent as a result (including the pulses sent by the button itself)?
#   
# In the first example, the same thing happens every time the button is pushed: 
# 8 low pulses and 4 high pulses are sent. So, after pushing the button 1000 
# times, 8000 low pulses and 4000 high pulses are sent. Multiplying these 
# together gives 32000000.
# 
# In the second example, after pushing the button 1000 times, 4250 low pulses 
# and 2750 high pulses are sent. Multiplying these together gives 11687500.
# 
# Consult your module configuration; determine the number of low pulses and high 
# pulses that would be sent after pushing the button 1000 times, waiting for all 
# pulses to be fully handled after each push of the button. What do you get if 
# you multiply the total number of low pulses sent by the total number of high 
# pulses sent?

# Part One ----------------------------------------------------------------
modules <- data |> 
  str_split_1("\n") |> 
  lapply(\(x) {
    list(
      name = str_extract(x, "[a-z]+(?=\\s\\-\\>\\s)"),
      op = str_extract(x, "^(\\%|\\&)"),
      destinations = str_extract(x, "(?<=\\-\\>\\s).*") |> str_split_1(",") |> str_extract_all("[a-z]+") |> unlist()
    )
  })

find_input_modules <- function(module) {
  modules[map(modules, \(x) { module %in% x$destinations }) |> unlist()] |> 
    lapply(\(m) m$name) |> 
    unlist()
} 

send <- function(module, from, pulse, score = c(0, 0), memory = dict()) {
  m <- first(modules[map(modules, \(x) { x$name == module}) |> unlist()])
  if(is.null(m)) return(list(score=score, memory=memory))
  p <- 0
  if(is.na(m$op)) {
    p <- pulse
  } else if(m$op == "%" & pulse == 1) {
    ff <- memory$get(m$name, FALSE)
    memory$set(m$name, !ff)
    p <- ifelse(ff, 1, 2)
  } else if(m$op == "&"){
    mem <- memory$get(module, NULL)
    if(is.null(mem)) {
      inp <- find_input_modules(m$name)
      mem <- dict(rep(1, length(inp)), inp)
    }
    mem$set(from, pulse)
    memory$set(m$name, mem)
    p <- if(all(mem$values() |> unlist() == 2)) 1 else 2
  }
  if(p > 0) {
    for(c in m$destinations) {
      score[p] <- score[p] + 1
      que$push(c(c, m$name, p))
    }
  }
  return(list(score=score, memory=memory))
}

memory <- dict()
que <- queue()
score <- c(0, 0)
for(i in 1:1000) {
  score[1] <- score[1] + 1
  que$push(list("broadcaster", "button", 1))
  while(que$size() > 0) {
    p <- que$pop()
    res <- send(p[[1]], p[[2]], p[[3]], score, memory)
    score <- res$score
    memory <- res$memory
  }
}
score |> prod() |> print(digits = 16)

# Answer: 834323022


# Part Two: Description ---------------------------------------------------
# The final machine responsible for moving the sand down to Island Island has a 
# module attached named rx. The machine turns on when a single low pulse is sent 
# to rx.
# 
# Reset all modules to their default states. Waiting for all pulses to be fully 
# handled after each button press, what is the fewest number of button presses 
# required to deliver a single low pulse to the module named rx?

# Part Two ----------------------------------------------------------------
#
# Tried brute force. Didn't work. Tried to think. Didn't work either.
#
# Ok, so it's one of those days where problem with part two lies in the data. I
# looked at the subreddit for clues and people had been feeding the input data
# into graph visualisations and figured out how to solve it that way. The graphs
# they shared didn't make any sense to me until I realised that the input data
# varies between persons. That didn't help anyhow, since there must be a way to
# solve the problem without doing the calculations by hand.
#
# So I cheated. Since the problems for the past few days have been harder 
# versions of previous days my guess is that the same goes for today. The most 
# similar day I could think of is day 8. So that'll be my starting point for 
# today. Day 8's solution was based on finding repeat patterns in the data, so
# that'll be what I'll be looking for today as well.
#
# Anyhow. I started looking at the end module, rx. It was being fed by one 
# conjunction node, rs. So for rs to receive a low pulse rs must have high 
# pulses memorised for each of it's input nodes. So we should be able to look
# for how many button presses it takes for each of the memorised pulses in rs to 
# be high pulses individually. The total number of button presses for all of 
# them to be memorised as highs should be divisible by each of the individual 
# counts, which should be the product of all the counts. Or the least common 
# multiplier of them.
# 
# find_input_modules("rx")
# # [1] "rs"
# 
# find_input_modules("rs")
# # [1] "bt" "dl" "fr" "rv"
# 
# for(m in find_input_modules("rs")) {
#   print(paste0("Module: ", m))
#   print(find_input_modules(m))
# }
# # [1] "Module: bt"
# # [1] "mj"
# # [1] "Module: dl"
# # [1] "qs"
# # [1] "Module: fr"
# # [1] "rd"
# # [1] "Module: rv"
# # [1] "cs"

# For this to work I have made a few assumptions.
# - The input data is constructed for this solution to work
# - The rs module is being fed by modules able to send high pulses
# - Each of the modules feeding highs into the rs module does so on cyclic intervals
#
#            <- &bt <- mj ...
#  rx <- &rs <- &dl <- qs ...
#            <- &fr <- rd ...
#            <- &rv <- cs ...

key_module <- find_input_modules("rx")         # This is the module that will be sending a low to rx
key_senders <- find_input_modules(key_module)  # These are the modules that will be sending highs to the key_module

cycles <- dict(rep(0, length(key_senders)), key_senders) # Dictionary with the cycle lengths of the key senders, initialised to 0
memory <- dict()
que <- queue()
i <- 1
repeat {
  que$push(list("broadcaster", "button", 1))
  while(que$size() > 0) {
    p <- que$pop()
    if(p[[1]] == key_module & p[[3]] == "2") 
      cycles$set(p[[2]], i)
    memory <- send(p[[1]], p[[2]], p[[3]], score, memory)$memory
  }
  if(prod(cycles$values() |> unlist() )> 0) break
  i <- i + 1
}
cycles$as_list() |> unlist() |> prod()  |> print(digits = 16)
cycles$as_list() |> reduce(Lcm) |> print(digits = 16)

# Answer: 225386464601017

