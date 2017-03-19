#!/bin/bash
#SBATCH -J array-analysis.R
#SBATCH -A account_name # Account name
#SBATCH --time=5:00     # Walltime
#SBATCH --mem=512  # memory/node (in MB)
#SBATCH --reservation=workshop



# example usage:
# sbatch -A <account_name> run_array-analysis.sl ../data/inflammation-01.csv




# load in the R module
module load R/3.3.0-intel-2015a 

#$1 is the path to the csv file
srun Rscript ../R/array-analysis.R $1 
