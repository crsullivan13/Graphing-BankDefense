#!/bin/bash

#extracts data from FireSim workload outputs for simple disparity budget test
#dirs are stored in disparity-budget-dirs.txt after workloads are done
#make sure to do this extraction after each run as we overwrite the dirs text file for each set of workloads

set -euo pipefail

outputdir="outputs/sdvbs"

OUT=AttackTests/outputs/sdvbs-budget-slowdown.csv
echo > $OUT

subdirs=("-5120-5120")
workloads=("mser" "sift" "stitch" "svm" "tracking" "disparity" "localization" )

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "sdvbs-budget-dirs.txt"

indexOut=0
dirIndex=0
for load in ${workloads[@]}; do
    #echo $load
    solo=$(cat "${dirs[$indexOut]}$load${subdirs[0]}/$outputdir/$load-solo.txt")
    #echo $solo
    victim=$(cat "${dirs[$indexOut]}$load${subdirs[0]}/$outputdir/$load-victim.txt" | grep -i usecs | awk 'NF{print $(NF)}')
    #echo $victim
    workloads[$indexOut]+=",$(bc <<< "scale=3; $victim/$solo")"
    echo ${workloads[$indexOut]} >> $OUT
    ((indexOut += 1))
    ((dirIndex += 3))
done
#echo ${workloads[@]}