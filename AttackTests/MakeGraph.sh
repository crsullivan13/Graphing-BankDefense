#!/bin/bash

set -euo pipefail

#dir=$1

rm -r figs ; mkdir figs

#python DiffBanksW-bw.py $dir
#python DiffBanksR-bw.py $dir

gnuplot sepbanks-slowdown-pi4.gp
gnuplot sepbanks-slowdown-beaglev.gp
gnuplot slowdown-mempress.gp

mv *.png figs/
#tar -czvf figs.tar.gz figs/
