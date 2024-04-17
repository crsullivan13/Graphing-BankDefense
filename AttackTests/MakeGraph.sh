#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot sepbanks-slowdown-pi4.gp
gnuplot sepbanks-slowdown-beaglev.gp
gnuplot sepbanks-llcstat-beaglev.gp
gnuplot slowdown-mempress-bkaware.gp
gnuplot budget-slowdown-bars.gp

#mv *.png figs/
mv *.pdf figs/
