#!/bin/bash

#extracts data from FireSim workload outputs for simple mempress attack test
#dirs are stored in contention-dirs.txt after workloads are done
#make sure to do this extraction after each run as we overwrite the dirs text file for each set of workloads

set -euo pipefail

outputdir="outputs"
outfile="out.txt"
OUT=slowdown-mempress-baseBRU.csv
> $OUT
echo "Type,BkPLLRead Solo,Sep Bank,Same Bank,Throttled Attackers" >> $OUT

subdirs=("contention-solo-solo" "contention-sepBankR-sepBankR" "contention-sameBankR-sameBankR" "contention-sepBankW-sepBankW" "contention-sameBankW-sameBankW" 
        "contention-throttledR-throttledR" "contention-throttledW-throttledW")

dirs=()

read="Read"
write="Write"

while IFS= read -r line; do
    dirs+=("$line")
done < "contention-dirs.txt"

solobw=$(cat "${dirs[0]}${subdirs[0]}/$outputdir/bkpll-solo.txt")
read+=",1.00"
write+=",1.00"

diffbw=$(cat "${dirs[1]}${subdirs[1]}/$outputdir/synth-attack/sep-bankR.txt")
samebw=$(cat "${dirs[2]}${subdirs[2]}/$outputdir/synth-attack/same-bankR.txt")
throttledbw=$(cat "${dirs[5]}${subdirs[5]}/$outputdir/synth-attack/throttledR.txt")
read+=",$(bc <<< "scale=2; $solobw/$diffbw"),$(bc <<< "scale=2; $solobw/$samebw"),$(bc <<< "scale=2; $solobw/$throttledbw")"
echo "$read" >> $OUT

diffbw=$(cat "${dirs[3]}${subdirs[3]}/$outputdir/synth-attack/sep-bankW.txt")
samebw=$(cat "${dirs[4]}${subdirs[4]}/$outputdir/synth-attack/same-bankW.txt")
throttledbw=$(cat "${dirs[6]}${subdirs[6]}/$outputdir/synth-attack/throttledW.txt")
write+=",$(bc <<< "scale=2; $solobw/$diffbw"),$(bc <<< "scale=2; $solobw/$samebw"),$(bc <<< "scale=2; $solobw/$throttledbw")"
echo "$write" >> $OUT
