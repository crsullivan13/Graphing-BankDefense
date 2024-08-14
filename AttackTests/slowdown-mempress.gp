set datafile separator ','
set xlabel "Attack Access Type"
set ylabel "Normalized Victim Slowdown"

set terminal pdf


set key top right
set style data histogram
set style histogram cluster gap 2
set style fill solid border -1
#set xtics rotate by -45
set grid ytics
set xrange [0:]
set yrange [0:5]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

#set title "Victim Bank Isolation"
set output 'slowdown-bank-isol.pdf'

set xlabel ""
unset xtics

plot 'outputs/slowdown-mempress-baseBRU.csv' using 2:xtic(1) title 'Victim Solo' lc rgb "#4477AA",    \
    '' using 3 title 'Attackers on Diff. Bank' lc rgb "#228833", \
    '' using 4 title 'Attackers on Same Bank' lc rgb "#EE6677", \

#set title "Per-bank Versus All-bank Victim Protection"
set output 'slowdown-attackers-regulated.pdf'
set xlabel ""
unset xtics

plot 'outputs/slowdown-mempress-baseBRU.csv' using 5:xtic(1) title 'Attackers Regulated All-Bank' lc rgb "#4477AA", \
    'outputs/slowdown-mempress-bkaware.csv' using 5 title 'Attackers Regulated Per-Bank' lc rgb "#228833", \
    #'outputs/slowdown-mempress-baseBRU.csv' using 4 title 'Attackers No Regulation' lc rgb "#EE6677", \

