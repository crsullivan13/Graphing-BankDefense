#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot sepbanks-llcstat-pi4.gp
gnuplot sepbanks-slowdown-devboards.gp
gnuplot sepbanks-llcstat-beaglev.gp
gnuplot slowdown-mempress.gp
gnuplot budget-slowdown-bars.gp

mv *.pdf figs/
