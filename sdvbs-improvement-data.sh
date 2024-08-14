#!/bin/bash

#extracts data from FireSim outputs for single and multi core sdvbs tests
#workload output dirs in sdvbs-all-dirs.txt
#run this after running the workloads to put data in csvs for graphing

set -euo pipefail

outputdir="outputs/sdvbs/"

workloads=(disparity localization mser sift stitch svm tracking)

OUT1=BwTests/outputs/sdvbs-single-core
OUT2=BwTests/outputs/sdvbs-multi-core

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "sdvbs-all-dirs.txt"

for type in ${workloads[@]}; do
    echo "bankcount,baseline,perbank" > $OUT1/$type.csv
    echo "bankcount,baseline,perbank" > $OUT2/$type.csv
done

#single
for type in ${workloads[@]}; do
    twoBank="2 Banks"
    fourBank="4 Banks"
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

    echo "$twoBank" >> $OUT1/$type.csv
    echo "$fourBank" >> $OUT1/$type.csv
done

#multi
for type in ${workloads[@]}; do
    twoBank="2 Banks"
    fourBank="4 Banks"
    index=0

    for dir in ${dirs[@]}; do
        mapfile -t numbers < "${dir}sdvbs-all-sdvbs-all/$outputdir/$type-multi.txt"
        if [[ $index < 2 ]]; then
            twoBank+=",$(bc <<< "scale=3; ${numbers[1]}/${numbers[0]}")"
            index=$((index+1))
        else
            fourBank+=",$(bc <<< "scale=3; ${numbers[1]}/${numbers[0]}")"
            index=$((index+1))
        fi
    done

    echo "$twoBank" >> $OUT2/$type.csv
    echo "$fourBank" >> $OUT2/$type.csv
done
