set datafile separator ','
set title "Bandwidth Read Slowdown vs. Increasing Budget"
set xlabel "Budget (MB/s)"
set ylabel "Normalized Slowdown"
set grid ytics
set key top right
set terminal pdf
set output 'nrt-budget-slowdown.pdf'
set xtics rotate by -45

set yrange[0:]
set xrange [0:11000]
set xtics (640, 1280, 2560, 5120, 10240)
plot 'outputs/bw-nrt-budget-slowdown.csv' every ::1 using 1:2 with lines lw 3 title "Slowdown"
   #'' using 1:3 with lines lw 3 title "Baseline BRU BW"

# set xrange [0:16000]
# set xtics (640, 1280, 2560, 5120, 7680, 10240, 12800, 15360)
# plot 'outputs/mpress-nrt-budget-slowdown.csv' every ::1 using 1:2 with lines lw 3 title "4 Bank-Aware BRU Mempress", \
#    '' using 1:3 with lines lw 3 title "Baseline BRU Mempress"     