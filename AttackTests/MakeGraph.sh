#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot sepbanks-slowdown-pi4.gp
gnuplot sepbanks-slowdown-beaglev.gp
gnuplot slowdown-mempress.gp
gnuplot budget-slowdown-bkaware.gp

mv *.png figs/
