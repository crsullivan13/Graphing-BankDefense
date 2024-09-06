#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot sepbanks-slowdown-devboards.gp
gnuplot slowdown-mempress.gp
gnuplot budget-slowdown-bars.gp

mv *.pdf figs/
