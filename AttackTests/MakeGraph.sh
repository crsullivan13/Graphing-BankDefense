#!/bin/bash

set -euo pipefail

dir=$1

python DiffBanks-slowdown.py $dir
python DiffBanksW-bw.py $dir
python DiffBanksR-bw.py $dir

mv *.png figs/
tar -czvf figs.tar.gz figs/
