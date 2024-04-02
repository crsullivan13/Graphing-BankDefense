#!/bin/bash

set -euo pipefail

dir=$1

python BothBank.py $dir
python Single.py $dir

mv *.png figs/
tar -czvf figs.tar.gz figs/
