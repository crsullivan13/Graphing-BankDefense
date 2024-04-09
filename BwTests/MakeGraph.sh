#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs

gnuplot singlebankbw-agg-bk0-beagle.gp
gnuplot bothbankbw-agg-beagle.gp

mv *.png figs/
