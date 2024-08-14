set datafile separator ','
set xlabel "Number of Cache Banks"
set ylabel "Normalized Slowdown"

set terminal pdf

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set grid ytics
set key top left
set xrange [0:]
set yrange [0:3]

array files = ['disparity.csv','mser.csv','sift.csv','stitch.csv','tracking.csv','svm.csv','localization.csv']
array titles = ['Disparity','MSER','SIFT','Stitch','Tracking','SVM','Localization']

getOutput(folder, prefix) = sprintf('outputs/%s/%s', folder, prefix)

# do for [prefix in "sdvbs-single-core sdvbs-multi-core"] {
#     postfix = (prefix eq "sdvbs-single-core") ? "single" : "multi"
#     type = (prefix eq "sdvbs-single-core") ? "Solo" : "Corun"

#     do for [i=1:|files|] {
#         set output sprintf('0%d-%s-%s.pdf', i, postfix, titles[i])
#         set title sprintf("All-Bank vs. Per-Bank Regulation (%s)", titles[i])

#         plot getOutput(prefix,files[i]) using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",   \
#             '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
#             '' using (column(0)):2:(sprintf("%.2f", $2)) with labels offset -3.2,.5 notitle, \
#             '' using (column(0)):3:(sprintf("%.2f", $3)) with labels offset 3,.5 notitle
#     }

# }

set output "real-world-2bk.pdf"
set xlabel "Workload"
#set title "All-Bank vs. Per-Bank Regulation (2 Banks)"

set style line 101 lc rgb 'black' lt 2 lw 2 dt 2
set arrow from graph 0,first 1 to graph 1,first 1 nohead ls 101

plot 'outputs/sdvbs-single-core/2bank.csv' using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",    \
     '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
     '' using (column(0)):2:(sprintf("%.2f", $2)) with labels font ",9" offset -1.5,.5 notitle, \
     '' using (column(0)):3:(sprintf("%.2f", $3)) with labels font ",9" offset 1.5,.5 notitle

set output "real-world-4bk.pdf"
set xlabel "Workload"
#set title "All-Bank vs. Per-Bank Regulation (4 Banks)"

plot 'outputs/sdvbs-single-core/4bank.csv' using 2:xtic(1) title 'All-Bank Regulation' lc rgb "#4477AA",    \
     '' using 3 title 'Per-Bank Regulation' lc rgb "#228833", \
     '' using (column(0)):2:(sprintf("%.2f", $2)) with labels font ",9" offset -1.5,.5 notitle, \
     '' using (column(0)):3:(sprintf("%.2f", $3)) with labels font ",9" offset 1.5,.5 notitle