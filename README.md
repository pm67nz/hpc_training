# Introduction to HPC using NeSI

Training materials for a hands-on workshop on introduction to HPC using NeSI, including scripts for NeSI HPC training workshop. The materials are largely based on the content created by the University of Otago staff, New Zealand eScience Infrastructure staff and Centre for eResearh at the University of Auckland.

###Contributors: Murray Cadzow, Matthew Healey, Gene Soudlenkov, Sung Bae, Benjamin Roberts,  Bart Verleye, Jordi Blasco, Martin Feller, Peter Maxwell, Sina Masoud-Ansari, Aleksandra Pawlik
(if you are contributing to the materials, please add your name to the list)


##Learning objectives (what you will know after this workshop):

* Learn how to log in on NeSI clusters (Pan) and navigate your  way thorough the environment set up on the login node.
* Know how to transfer (small to medium-sized) data files and scripts to the cluster via: scp or MobaXterm. 
* Be able to connect to one of the build/compute nodes.
* Understand (roughly) the difference between *login* and *build*/*compute* nodes, and how to use them when working on NeSI (or other HPC) infrastructure.
* Know and understand the default resources allocation (disk quota, use of scratch space, etc), and be aware of possible problems when exceeding the quota, leaving files in scratch space and so on.
* Understand (roughly) what environment modules are. Be able to view currently loaded modules, list available modules and load the modules you want to use.
* Know what a job scheduler is for and how to use it (modify a SLURM script, use SLURM commands in the command line mode).
* Understand (roughly) what Message Parsing Interface is for and become familar with its basic use.
* Understand what queuing system is and become aware of the impact of submitting jobs to different typse of queues.
* Be able to submit a job on a NeSI cluster (Pan) - based on the provided example using R scripts.
* Understand the avdantages of using parallelism computational work, and deploy it in the case of embarrasinly prallel jobs (by modifying SLURM script). Possibly be able to evaluate if the problem is embarrasingly parallel.
* Be able to monitor the job state and execution.
* Know how to access the output of the job and download locally files with output data.
* Know the best practices for cleaning up their work environment on the cluster.
* Be familiar and adhere to the NeSI use policy.

(Possibly beyond the scope of the workshop due to time limitations but useful to achieve)
* Know how to get installed software that is not currently available on the cluster
  

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

A script to demonstrate using a slurm array job to run an analysis in parallel on different input datasets

Output will be captured in the slurm output file

```
sbatch -A account_name run_array-analysis.sl
```


