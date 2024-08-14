set datafile separator ','
set title "Pi4 Victim Slowdown"
#set xlabel "Victim Working Set Size (KB)"
set ylabel "Normalized Victim Slowdown"
#set key left top font ",12" Left
set lmargin at screen 0.1

set terminal pdf
set output 'slowdown-pi4.pdf'

set key top left font ",10" Left
set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set grid ytics
unset xtics
set xrange [0:]
set yrange [0:10]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101
#set arrow from 5.5,0 to 5.5,15 nohead dt "-"

plot 'outputs/sepbanks-slowdown-pi4.csv' using 2:xtic(1) title 'Victim Solo',    \
    '' using 3 title 'Attackers on Diff. Bank',    \
    '' using 4 title 'Read Attackers on Same Bank',   \
    '' using 5 title 'Write Attackers on Same Bank',  \
