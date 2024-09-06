#!/bin/bash

#extracts data from FireSim outputs for single core synth tests
#workload output dirs in Fig10-dirs.txt
#run this after running the workloads to put data in csvs for graphing

set -euo pipefail

outputdir="outputs"

OUT1=BwTests/outputs/synth-baseline-slowdown.csv

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "Fig10-dirs.txt"

echo "bankcount,baseline,perbank" > $OUT1

twoBank="2 Banks"
fourBank="4 Banks"
index=0
for dir in ${dirs[@]}; do
    solo=$(cat "${dir}bandwidth-1280-1280/$outputdir/solo.txt")
    reg=$(cat "${dir}bandwidth-1280-1280/$outputdir/solo-reg.txt")
    if [[ $index < 2 ]]; then
        twoBank+=",$(bc <<< "scale=3; $solo/$reg")"
    else
        fourBank+=",$(bc <<< "scale=3; $solo/$reg")"
    fi
    index=$((index+1))
done

echo "$twoBank" >> $OUT1
echo "$fourBank" >> $OUT1
