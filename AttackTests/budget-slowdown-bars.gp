set datafile separator ','
set xlabel "Attacker Bandwidth Budget (MB/s)"
set ylabel "Normalized Victim Slowdown"

set terminal pdf

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set grid ytics
set xtics rotate by -45
set xrange [0:]
set yrange [0:6]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

#set title "Victim Slowdown vs. Increasing Attacker Budget"
set output 'budget-slowdown.pdf'

plot 'outputs/disparity-budget-slowdown.csv' using 2:xtic(1) title "Disparity Victim" lc rgb "#228833" , \
     'outputs/synth-budget-slowdown.csv' using 2:xtic(1) title "Synthetic Victim" lc rgb "#4477AA" , \

# set title "Victim Slowdown Upper Bound (5.12GB/s Regulation Budget)"
# set output 'sdvbs-budget-slowdown.pdf'
# set xtics rotate by 0
# set xrange [-1:]
# set yrange [0:1.5]
# set key outside top center horizontal

# plot 'outputs/sdvbs-budget-slowdown.csv' using 2:xtic(1) title "SD-VBS Victim Slowdown" lc rgb "#EE6677", \
#      1.35 lc rgb 'black' dt 2 title "Synthetic Victim Slowdown"
     