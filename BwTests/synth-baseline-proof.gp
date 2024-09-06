set datafile separator ','
#set title "All-Bank vs. Per-Bank Regulation Slowdown (Synthetic)"
set xlabel "Number of Cache Banks"
set ylabel "Normalized Slowdown"

set terminal pdf
set output 'synth-baseline-comparison.pdf'

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set grid ytics
set key top left
#set xtics rotate by -45
set xrange [0:]
set yrange [0:7500]

set yrange [0:7]
set key top right
set ylabel "Normalized Slowdown"

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/synth-baseline-slowdown.csv' using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",   \
   '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
   '' using (column(0)):2:(sprintf("%.2f", $2)) with labels offset -3.3,.5 notitle, \
   '' using (column(0)):3:(sprintf("%.2f", $3)) with labels offset 3.3,.5 notitle