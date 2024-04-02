#!/bin/bash

set -euo pipefail

dir=$1

rm -r figs ; mkdir figs

python BothBank.py $dir
python SingleBank.py $dir

mv *.png figs/
tar -czvf figs.tar.gz figs/
