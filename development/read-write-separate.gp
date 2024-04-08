set datafile separator ','
set title "Same Domain Separate Throttling"
set xlabel "Access Type"
set ylabel "Bandwidth (MB/s)"

set terminal png
set output 'read-write-separate.png'

set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram cluster gap 2
set style fill pattern border -1
set xtics rotate by -45
set grid ytics
set xrange [0:]

plot 'read-write-separate.csv' using 2:xtic(1) title 'Unthrottled',    \
    '' using 3 title 'Throttled'

