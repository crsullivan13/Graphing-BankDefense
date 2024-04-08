set datafile separator ','
set title "2xMempress Attackers Slowdown"
set xlabel "Attack Access Type"
set ylabel "Normalized Slowdown"

set terminal pngcairo
set output 'slowdown-mempress.png'

set style data histogram
set style histogram cluster gap 2
set style fill pattern border -1
set xtics rotate by -45
set grid ytics
set xrange [0:]
set yrange [0:10]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/slowdown-mempress.csv' using 2:xtic(1) title 'BkPLLRead Solo',    \
    '' using 3 title 'Sep Bank', \
    '' using 4 title 'Same Bank', \
    '' using 5 title 'Throttled Attackers', \

