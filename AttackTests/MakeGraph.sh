#!/bin/bash

set -euo pipefail

dir=$1

rm -r figs ; mkdir figs

python DiffBanks-slowdown.py $dir
python DiffBanksW-bw.py $dir
python DiffBanksR-bw.py $dir

mv *.png figs/
tar -czvf figs.tar.gz figs/
