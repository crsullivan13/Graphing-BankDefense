set datafile separator ','
set title "BeagleV Bank Isolation -- Read/Write"
set xlabel "Victim WSS (KB)"
set ylabel "Normalized Slowdown"
set key left top font ",12" Left
set lmargin at screen 0.1

set terminal pdf
set output 'sepbanks-slowdown-beaglev.pdf'

set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set grid ytics
set xrange [0:]
set yrange [0:10]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/sepbanks-slowdown-beaglev.csv' using 2:xtic(1) title 'BkPLLRead Solo',    \
    '' using 3 title '3xBkPLL Sep Bank',    \
    '' using 4 title '3xBkPLLWrite Same Bank',   \
    #'' using 5 title '3xBkPLLRead Same Bank',  \
