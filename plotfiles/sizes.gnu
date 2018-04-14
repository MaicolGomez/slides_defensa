APP = "sizes"
OUTPUT_FILE = APP . '.pdf'

set terminal pdf enhanced size 10,6
set output OUTPUT_FILE
set key top right
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 20"
set ytics font ", 20"
set ylabel font ",28" offset -2
set key font ",32"

#set grid ytics

set lmargin 12
set bmargin 10

set style data histogram
set style histogram cluster title offset 0,-3
set bars fullwidth
set boxwidth 1.0 absolute
set style fill solid noborder
set nologscale
set yrange[0:400]

#set logscale y

set ylabel "Absolute runtime (s)"

set xtics ("SMALL" 0, "MEDIUM" 1, "LARGE" 2, "HUGE" 3, "" 4, "SMALL" 5, "MEDIUM" 6, "LARGE" 7, "HUGE" 8, "" 9, "SMALL" 10, "MEDIUM" 11, "LARGE" 12, "HUGE" 13)

plot \
newhistogram "3MM" font ",28" lt 3, '3mm.dat' u 2 t "GPUClang w/ DCO", '' u 3 t "Sequencial", \
newhistogram "GEMM" font ",28" lt 3, 'gemm.dat' u 2 notitle, '' u 3 notitle, \
newhistogram "GRAMSCHM" font ",28" lt 3, 'gramschm.dat' u 2 notitle, '' u 3 notitle
set output
