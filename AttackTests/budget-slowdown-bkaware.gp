set datafile separator ','
set title 'Slowdown vs. Increasing Per Bank Budget'
set xlabel 'Per Bank Budget (MB/s)'
set ylabel 'Normalized Slowdown'

set terminal pngcairo
set output 'budget-slow-bkaware.png'

set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set xtics rotate by -45
set grid ytics
set xrange [0:]
set yrange [0:10]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/budget-slowdown-bkaware.csv' using 2:xtic(1) title 'Victim Slowdown'