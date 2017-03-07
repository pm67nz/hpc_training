# hpc_training
Scripts for NeSI HPC training workshop


Download the code using
```
git clone https://github.com/murraycadzow/hpc_training.git
cd hpc_training
```

Download the example data by running
```
bash get_data.sh
```


#### run_simple.sl

A script to run the R script simple.R as an example of submitting a R script using slurm

Output will be captured in the slurm output file

```
sbatch -A account_name run_simple.sl
```

#### run_print-args.sl

A script to demonstrate passing in commandline arguments to an Rscript as part submitting a slurm job

Output will be captured in the slurm output file

```
sbatch -A account_name run_print-args.sl first second third
```


#### run_array-analysis

A script to calculate the mean by patient for each csv file in parallel using a slurm array job

```
sbatch -A account_name run_array-analysis.sl
```


