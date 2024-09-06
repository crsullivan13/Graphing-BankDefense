#!/bin/bash

#extracts data from FireSim outputs for single core sdvbs tests
#workload output dirs in Fig11-dirs.txt
#run this after running the workloads to put data in csvs for graphing

set -euo pipefail

outputdir="outputs/sdvbs/"

workloads=(disparity mser stitch)

OUT1=BwTests/outputs/sdvbs-single-core

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "Fig11-dirs.txt"

echo "bankcount,baseline,perbank" > $OUT1/2bank.csv
echo "bankcount,baseline,perbank" > $OUT1/4bank.csv

#single
for type in ${workloads[@]}; do
    twoBank="$type"
    fourBank="$type"
    index=0

    for dir in ${dirs[@]}; do
        mapfile -t numbers < "${dir}sdvbs-all-sdvbs-all/$outputdir/$type-single.txt"
        if [[ $index < 2 ]]; then
            twoBank+=",$(bc <<< "scale=3; ${numbers[1]}/${numbers[0]}")"
            index=$((index+1))
        else
            fourBank+=",$(bc <<< "scale=3; ${numbers[1]}/${numbers[0]}")"
            index=$((index+1))
        fi
    done

    echo "$twoBank" >> $OUT1/2bank.csv
    echo "$fourBank" >> $OUT1/4bank.csv
done
