#!/bin/bash

#extracts data from FireSim workload outputs for contention tests
#dirs are stored in Fig7-9-dirs.txt after workloads are done
#make sure to do this extraction after each run as we overwrite the dirs text file for each set of workloads

set -euo pipefail

workload="contention"
outputdir="outputs"
outsubdir="synth-attack"
victimout="bkpll-victim.txt"
soloout="bkpll-solo.txt"

OUT=AttackTests/outputs/contention-allbank-slowdown.csv
echo "type,solo,diff-bank,same-bank,throttled-attackers" > $OUT

subdirs=("-solo-solo" "-sepBankW-sepBankW" "-sameBankW-sameBankW" "-throttledW-throttledW")

dirs=()

while IFS= read -r line; do
    dirs+=("$line")
done < "Fig7-9-dirs.txt"

victimSlowdowns=("write")

for i in 0 1 2 3; do
    solo=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/$soloout")
    echo $solo
    if [ $i != 0 ]; then
        echo "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/synth-attack/$victimout"
        victim=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/synth-attack/$victimout")
        echo $victim
    else
        victim=$solo
    fi
    victimSlowdowns[0]+=",$(bc <<< "scale=3; $solo/$victim")"
done
echo "${victimSlowdowns[0]}" >> $OUT


OUT=AttackTests/outputs/contention-perbank-slowdown.csv
echo "type,solo,diff-bank,same-bank,throttled-attackers" > $OUT
victimSlowdowns=("write")

for i in 4 5 6 7; do
    solo=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/$soloout")
    echo $solo
    if [ $i != 0 ]; then
        echo "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/synth-attack/$victimout"
        victim=$(cat "${dirs[$i]}$workload${subdirs[$i]}/$outputdir/synth-attack/$victimout")
        echo $victim
    else
        victim=$solo
    fi
    victimSlowdowns[0]+=",$(bc <<< "scale=3; $solo/$victim")"
done
echo "${victimSlowdowns[0]}" >> $OUT