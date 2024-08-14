set datafile separator ','
#set title "Victim Slowdown (Dev Boards)"
#set xlabel "Platform"
set ylabel "Normalized Victim Slowdown"
#set key left top font ",12" Left
set lmargin at screen 0.1

set terminal pdf
set output 'slowdown-devboards.pdf'

set key top left font ",12" Left
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set grid ytics
#unset xtics
set yrange [0:10]
set xrange [0:]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101
#set arrow from 5.5,0 to 5.5,10 nohead dt "-"

plot 'outputs/sepbanks-slowdown-devboards.csv' using 2:xtic(1) title 'Victim Solo' lc rgb "#228833",    \
    '' using 3 title 'Attackers on Diff. Bank' lc rgb "#4477AA",    \
    '' using 5 title 'Attackers on Same Bank' lc rgb "#EE6677",  \
