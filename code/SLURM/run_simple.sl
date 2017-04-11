#!/bin/bash -e
#SBATCH -J simple.R
#SBATCH -A project_code # Nesi project code eg nesi99999 or uoo99999
#SBATCH --time=01:00     # Walltime
#SBATCH --mem=512  # memory/node (in MB)
#SBATCH --reservation=workshop

# example usage:
# sbatch -A nesi99999 run_simple.sl


# load in the R module
module load R/3.3.0-intel-2015a 

srun Rscript ../R/simple.R
