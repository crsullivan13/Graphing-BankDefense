#set datafile separator ','
set xlabel "Workload"
set ylabel "Normalized Bank Access Count"

set terminal pdf

set key outside top center horizontal
set style data histogram
set style histogram cluster gap 2
set style fill pattern border -1
set grid ytics
#set xtics rotate by -45
set xrange [-1:]
set yrange [0:1.2]

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2

set title "SD-VBS Four Bank LLC Access Patterns"
set output 'sdvbs-4bank-access.pdf'

plot 'outputs/sdvbs-4bank-access.csv' using 2:xtic(1) title "Bank 1", \
     '' using 3:xtic(1) title "Bank 2", \
     '' using 4:xtic(1) title "Bank 3", \
     '' using 5:xtic(1) title "Bank 4", \
     1.00 lc rgb 'black' dt 2 notitle

set title "SD-VBS Two Bank LLC Access Patterns"
set output 'sdvbs-2bank-access.pdf'

plot 'outputs/sdvbs-2bank-access.csv' using 2:xtic(1) title "Bank 1", \
     '' using 3:xtic(1) title "Bank 2", \
     1.00 lc rgb 'black' dt 2 notitle
     