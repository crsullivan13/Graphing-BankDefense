#!/bin/bash

#extracts data from FireSim workload outputs for simple synthetic budget test
#dirs are stored in synth-budget-dirs.txt after workloads are done
#make sure to do this extraction after each run as we overwrite the dirs text file for each set of workloads

set -euo pipefail

outputdir="outputs"
victimout="bkpll-victim.txt"
bkpllout="bkpll-solo.txt"

OUT=AttackTests/outputs/synth-budget-slowdown.csv
echo "budget,slowdown-basebru" > $OUT

types=("base")
subdirs=("-640-640" "-1280-1280" "-2560-2560" "-5120-5120" "-7680-7680" "-10240-10240" "-12800-12800" "-15360-15360")

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "synth-budget-dirs.txt"

victimSlowdowns=("640" "1280" "2560" "5120" "7680"
            "10240" "12800" "15360")

bwbase=0
mpressbase=0
for i in {0..7}; do
    bkpllsolo=$(cat "${dirs[$i]}${types[0]}${subdirs[$i]}/$outputdir/$bkpllout")
    victim=$(cat "${dirs[$i]}${types[0]}${subdirs[$i]}/$outputdir/synth-attack/$victimout")
    echo $bkpllsolo
    echo $victim
    victimSlowdowns[$i]+=",$(bc <<< "scale=2; $bkpllsolo/$victim")"
    echo "${victimSlowdowns[$i]}" >> $OUT
done