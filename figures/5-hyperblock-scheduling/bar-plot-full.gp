set datafile separator ','

myOffset = 1
myWidth = 0.2
myWidth2 = 0.16
set style fill solid 1.0

#set boxwidth 0.5 relative
#set grid xtics

set linetype 2 lc rgb "#66c2a5"
set linetype 3 lc rgb "#fc8d62"
set linetype 4 lc rgb "#8da0cb"
set linetype 5 lc rgb "#e78ac3"
set linetype 6 lc rgb "#a6d854"

set size 1,1
set origin 0,0

#set key right top
set key outside
set key above

set logscale y
set format y "%.0f"

unset bmargin; unset lmargin; unset tmargin; unset rmargin
set multiplot layout 4,1

unset xtics

set arrow 1 front from graph 0, first myOffset to graph 1, first myOffset nohead ls -1 lc rgb "#a6d854"
set ylabel "(a) Relative execution time"

set yrange [0.9:30]

set size 1,0.33
set origin 0,0.67

set format y "%.1f"
set ytics (1, 1.4, 2, 2.8, 4, 5.6, 8, 11, 15.4, 22)

plot sample [x=0:56:1] '+' us (x/2-0.5):(31/(int(x)%4!=1)) with filledcurves x1 fc rgb "#EEEEEE" notitle, \
     'speed.csv' every ::1 using 0:($2/$6):($0-(1.6*myWidth)-myWidth/2.):($0-(1.6*myWidth)+myWidth/2.):(myOffset):($2/$6):xtic(1) with boxxyerror title "Vericert-original",\
     '' every ::1 using 0:($3/$6):($0-(0.55*myWidth)-myWidth/2.):($0-(0.55*myWidth)+myWidth/2.):(myOffset):($3/$6):xtic(1) with boxxyerror title "Vericert-list-scheduling", \
     '' every ::1 using 0:($4/$6):($0+(0.55*myWidth)-myWidth/2.):($0+(0.55*myWidth)+myWidth/2.):(myOffset):($4/$6):xtic(1) with boxxyerror title "Vericert-hyperblock-scheduling", \
     '' every ::1 using 0:($5/$6):($0+(1.6*myWidth)-myWidth/2.):($0+(1.6*myWidth)+myWidth/2.):(myOffset):($5/$6):xtic(1) with boxxyerror title "Bambu-no-opt", \
     1/0 title "Bambu-opt" with boxes

unset yrange
set yrange [0.9:25]

set format y "%.1f"
set ytics (1, 1.584, 2.509056, 3.974344704, 6.29536201114, 9.97185342564, 15.7954158262, 25)
#set ytics (1, 1.4, 2, 2.8, 4, 5.6, 8, 11, 15.4, 22)

set ylabel "(b) Rel. cycle count"

set size 1,0.155
set origin 0,0.535

plot sample [x=0:56:1] '+' us (x/2-0.5):(26/(int(x)%4!=1)) with filledcurves x1 fc rgb "#EEEEEE" notitle, \
     'cycles.csv' every ::1 using 0:($2/$6):($0-(1.6*myWidth)-myWidth/2.):($0-(1.6*myWidth)+myWidth/2.):(myOffset):($2/$6):xtic(1) with boxxyerror notitle,\
     '' every ::1 using 0:($3/$6):($0-(0.55*myWidth)-myWidth/2.):($0-(0.55*myWidth)+myWidth/2.):(myOffset):($3/$6):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($4/$6):($0+(0.55*myWidth)-myWidth/2.):($0+(0.55*myWidth)+myWidth/2.):(myOffset):($4/$6):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($5/$6):($0+(1.6*myWidth)-myWidth/2.):($0+(1.6*myWidth)+myWidth/2.):(myOffset):($5/$6):xtic(1) with boxxyerror notitle

unset yrange
set yrange [0:11]
set nologscale y

set format y "%.1f"
set ytics (0, 2, 4, 6, 8, 10)

set ylabel "(c) Delay (ns)"

set size 1,0.155
set origin 0,0.4

unset arrow
set arrow 1 front from graph 0, first 10 to graph 1, first 10 nohead ls -1 linecolor "#e41a1c" dashtype 2

plot sample [x=0:56:1] '+' us (x/2-0.5):(26/(int(x)%4!=1)) with filledcurves x1 fc rgb "#EEEEEE" notitle, \
     'delay.csv' every ::1 using 0:($2):($0-(2*myWidth2)-myWidth2/2.):($0-(2*myWidth2)+myWidth2/2.):(0):($2):xtic(1) with boxxyerror notitle,\
     '' every ::1 using 0:($3):($0-(myWidth2)-myWidth2/2.):($0-(myWidth2)+myWidth2/2.):(0):($3):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($4):($0+(0*myWidth2)-myWidth2/2.):($0+(0*myWidth2)+myWidth2/2.):(0):($4):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($5):($0+(myWidth2)-myWidth2/2.):($0+(myWidth2)+myWidth2/2.):(0):($5):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($6):($0+(2*myWidth2)-myWidth2/2.):($0+(2*myWidth2)+myWidth2/2.):(0):($6):xtic(1) with boxxyerror notitle

unset arrow
set arrow 1 front from graph 0, first myOffset to graph 1, first myOffset nohead ls -1 lc rgb "#a6d854"

set xtics scale 0 rotate by -90
unset yrange
set yrange [0.7:4]
set logscale y

set format y "%.2f"
set ytics (0.7, 0.83, 1, 1.2, 1.44, 1.728, 2.0736, 2.48832, 3, 3.5831808)

set ylabel "(d) Relative area"

set size 1,0.42
set origin 0,0

plot sample [x=0:56:1] '+' us (x/2-0.5):(5/(int(x)%4!=1)) with filledcurves x1 fc rgb "#EEEEEE" notitle, \
     'area.csv' every ::1 using 0:($2/$6):($0-(1.6*myWidth)-myWidth/2.):($0-(1.6*myWidth)+myWidth/2.):(myOffset):($2/$6):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($3/$6):($0-(0.55*myWidth)-myWidth/2.):($0-(0.55*myWidth)+myWidth/2.):(myOffset):($3/$6):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($4/$6):($0+(0.55*myWidth)-myWidth/2.):($0+(0.55*myWidth)+myWidth/2.):(myOffset):($4/$6):xtic(1) with boxxyerror notitle, \
     '' every ::1 using 0:($5/$6):($0+(1.6*myWidth)-myWidth/2.):($0+(1.6*myWidth)+myWidth/2.):(myOffset):($5/$6):xtic(1) with boxxyerror notitle

unset multiplot

#set key right bottom
#
#set size square
#
#set arrow from 0,0 to 2.6,2.6 nohead lc rgb 'grey'
#set arrow from 0,1 to 2.6,1 nohead lc rgb 'grey'
#set arrow from 1,0 to 1,3.5 nohead lc rgb 'grey'
#set xrange [0:2.6]
#set yrange [0:3.5]
#
#set ylabel "\\small Relative hyperlock scheduling area"
#set xlabel "\\small Relative list scheduling area"
#
#plot 'area.csv' using ($3/$6):($4/$6) with points pointtype 8 title "\\small Optimised Bambu", \
#     '' using ($3/$5):($4/$5) with points pointtype 8 title "\\small Bambu", \
#     '' using ($3/$2):($4/$2) with points pointtype 8 title "\\small Vericert"
