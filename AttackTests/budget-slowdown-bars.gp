set datafile separator ','
set title "Slowdown vs. Increasing Budget"
set xlabel "Aggregate Budget (MB/s)"
set ylabel "Normalized Slowdown"

set terminal pdf
set output 'budget-slowdown-bars.pdf'

set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set grid ytics
set xtics rotate by -45
set xrange [0:]
set yrange [0:6]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/budget-slowdown.csv' using 2:xtic(1) title 'Bank Aware BRU - 4 Banks',   \
    '' using 3 title 'Bank Aware BRU - 2 Banks', \
    '' using 4 title 'Baseline BRU'