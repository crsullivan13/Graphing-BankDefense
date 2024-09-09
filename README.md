## Creating figures
This process uses gnuplot, ensure you have it before proceeding.

If using pre-collected data. Navigate to either the AttackTests or BwTests directories run the MakeGraph.sh script. The resulting figures will be in a figs subdirectory.

If using data you have recreated. You will first need to run the corresponding data.sh script based on the figure you want to generate. This assumes you have run the automated workload scripts, or manually ran the workloads in the same order as the scripts. If you have manually run the workloads, ensure that you have placed the results directory path that the simulator outputs in the corresponding dirs.txt file, keeping the order. Once you have successfully run the data.sh script, the results will be in either the AttackTests or BwTests outputs subdirectory. You can then generate the figures as before.
