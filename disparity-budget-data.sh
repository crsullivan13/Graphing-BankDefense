#!/bin/bash

#extracts data from FireSim workload outputs for simple disparity budget test
#dirs are stored in disparity-budget-dirs.txt after workloads are done
#make sure to do this extraction after each run as we overwrite the dirs text file for each set of workloads

set -euo pipefail

workload=disparity
outputdir="outputs/sdvbs"
victimout="$workload-victim.txt"
soloout="$workload-solo.txt"

OUT=AttackTests/outputs/$workload-budget-slowdown.csv
echo "budget,slowdown-basebru" > $OUT

subdirs=("-640-640" "-1280-1280" 
        "-2560-2560" "-5120-5120" "-7680-7680" "-10240-10240" "-12800-12800" "-15360-15360")

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "$workload-budget-dirs.txt"

victimSlowdowns=("640" "1280" "2560" "5120" "7680"
            "10240" "12800" "15360")

for i in {0..7}; do
    solo=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/$soloout")
    echo $solo
    victim=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/$victimout" | grep -i usecs | awk 'NF{print $(NF)}')
    echo $victim
    victimSlowdowns[$i]+=",$(bc <<< "scale=3; $victim/$solo")"
    echo "${victimSlowdowns[$i]}" >> $OUT
done