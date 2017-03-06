#!/bin/bash
#SBATCH -J simple.R
#SBATCH -A account_name # Account name
#SBATCH --time=5:00     # Walltime
#SBATCH --mem=512  # memory/node (in MB)


# example usage:
# sbatch -A <account_name> run_print-args.sl first second third


# load in the R module
module load R/3.3.0-intel-2015a 

srun Rscript print-args.R $@ 
