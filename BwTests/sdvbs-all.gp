set datafile separator ','
set xlabel "Number of Cache Banks"
set ylabel "Best-effort Slowdown"

set terminal pdf

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set grid ytics
set key top left
set xrange [0:]
set yrange [0:3]

set output "real-world-2bk.pdf"
set xlabel "Workload"
#set title "All-Bank vs. Per-Bank Regulation (2 Banks, 1MB)"

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/sdvbs-single-core/2bank.csv' using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",    \
     '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
     '' using (column(0)):2:(sprintf("%.2f", $2)) with labels font ",9" offset -1.5,.5 notitle, \
     '' using (column(0)):3:(sprintf("%.2f", $3)) with labels font ",9" offset 1.5,.5 notitle

set output "real-world-4bk.pdf"
set xlabel "Workload"
#set title "All-Bank vs. Per-Bank Regulation (4 Banks, 1MB)"

plot 'outputs/sdvbs-single-core/4bank.csv' using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",    \
     '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
     '' using (column(0)):2:(sprintf("%.2f", $2)) with labels font ",9" offset -1.5,.5 notitle, \
     '' using (column(0)):3:(sprintf("%.2f", $3)) with labels font ",9" offset 1.5,.5 notitle