#!/bin/bash
#SBATCH -J simple.R
#SBATCH -A account_name #account name
#SBATCH --time=01:00     # Walltime
#SBATCH --mem=512  # memory/node (in MB)


# example usage:
# sbatch -A <account_name> run_simple.sl


# load in the R module
module load R/3.3.0-intel-2015a 

srun Rscript ../R/simple.R
