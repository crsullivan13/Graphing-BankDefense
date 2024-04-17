set datafile separator ','
set title "Four Bank LLC -- Throttled Mempress B/W"
set xlabel "Number of Banks Accessed"
set ylabel "Bandwidth (MB/s)"

set terminal pdf
set output '4bank-mempress-test.pdf'

set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set grid ytics
set key top left
#set xtics rotate by -45
set xrange [0:]

plot 'outputs/4bank-mempress-test.csv' using 2:xtic(1) title 'Read B/W',   \
    '' using 3 title 'Write B/W'