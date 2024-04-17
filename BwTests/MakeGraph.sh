#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot singlebankbw-agg-bk0-beagle.gp
gnuplot bothbankbw-agg-beagle.gp
gnuplot 4bank-mempress-test.gp
gnuplot 4bank-rocket-test.gp
gnuplot 4bank-boom-test.gp

mv *.pdf figs/
