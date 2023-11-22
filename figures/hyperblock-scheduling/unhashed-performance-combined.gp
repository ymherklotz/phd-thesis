set datafile separator ','

set linetype 1 lc rgb "#ca562c"
set linetype 2 lc rgb "#3d5941"

set logscale y

set style fill solid 1.0

set xlabel "Test number"
set ylabel "Time to verify symbolic state (s)"

plot 'unhashed-performance.csv' every ::1 using 2:xtic(1) with points pointtype 5 notitle,\
     '' every ::1 using 3:xtic(1) with points pointtype 12 notitle
