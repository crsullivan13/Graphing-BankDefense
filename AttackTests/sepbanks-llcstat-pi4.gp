set datafile separator ','
set title "Pi4 Victim LLC Missrate"
set xlabel "Victim Working Set Size (KB)"
set ylabel "LCC Missrate (%)"
set key left top font ",12" Left

set terminal pdf
set output 'llcstat-pi4.pdf'

set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set grid ytics
set xrange [0:]
set yrange [0:100]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from first 416, graph 0 to first 416,graph 1 nohead ls 101
set arrow from 5.5,0 to 5.5,100 nohead dt "-"

plot 'outputs/sepbanks-llcstat-pi4.csv' using 2:xtic(1) title 'Victim Solo',    \
    '' using 3 title 'Attackers on Seperate Bank',    \
    '' using 4 title 'Read Attackers on Same Bank',   \
    '' using 5 title 'Write Attackers on Same Bank',   \