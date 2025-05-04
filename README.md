## Creating Figures

### Prerequisites
This process requires **gnuplot**. Ensure it is installed before proceeding.

---

### Generating Figures Using Pre-Collected Data

1. **Navigate to the Appropriate Directory**  
   - Depending on the type of figure, navigate to either the `AttackTests` or `BwTests` directories.
   - `AttackTests` contains graphing scripts for figures that plot victim slowdown data.
   - `BwTests` containts graphing scripts for figures that plot best-effort throughput data.

2. **Run the `MakeGraph.sh` Script**  
   - Execute the script to generate the figures:  
     ```bash
     ./MakeGraph.sh
     ```

3. **Locate the Generated Figures**  
   - The resulting figures will be available in the `figs` subdirectory of the graphing directory you are in.

---

### Generating Figures Using Recreated Data

1. **Run the Corresponding `data.sh` Script**  
   - Based on the figure you want to generate, execute the relevant `data.sh` script. This will copy data from the simulator workload results directory and place it in the correct .csv files.
     **Note**: This assumes you have either:  
     - Run the automated workload scripts.  
     - Manually run the workloads in the same order as the scripts.

2. **Manually Run Workloads? Ensure Proper Setup**  
   - If you manually ran the workloads, ensure you:  
     - Place the results directory paths output by the simulator in the corresponding `dirs.txt` file.  
     - Maintain the same order as the scripts. Look at the order that the automated workload scripts would be run in to determine the ordering.

3. **Locate the Results**  
   - Once the `data.sh` script completes successfully, the results will be available in either the `AttackTests` or `BwTests` `outputs` subdirectory.

4. **Generate Figures**  
   - As with pre-collected data, run the `MakeGraph.sh` script in the appropriate directory to generate the figures.

