#!/bin/bash

set -euo pipefail

rm -r figs ; mkdir figs
#mkdir figs/sdvbs-single-core

gnuplot synth-baseline-proof.gp
gnuplot sdvbs-all.gp
#gnuplot bank-access.gp

#mv 0*single*.pdf figs/sdvbs-single-core
mv *.pdf figs/
