set datafile separator ','
set title "BeagleV Aggregate BW"
set xlabel "Aggregate Bandwidth (MB/s)"
set ylabel "Number of Cores"
set grid ytics
set key top left
set terminal pngcairo
set output 'bothbankbw-agg-beagle.png'

plot 'outputs/bothbankbw-agg-beagle.csv' every ::1 using 1:2 with lines lw 2 title "Aggregate BW"