set datafile separator ','
set title "BeagleV Single Bank Aggregate BW"
set xlabel "Aggregate Bandwidth (MB/s)"
set ylabel "Number of Cores"
set grid ytics
set key top left
set terminal pdf
set output 'singlebankbw-agg-bk0-beagle.pdf'

plot 'outputs/singlebankbw-agg-bk0-beagle.csv' every ::1 using 1:2 with lines lw 2 title "Aggregate BW"