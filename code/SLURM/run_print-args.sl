#!/bin/bash
#SBATCH -J print-args.R
#SBATCH -A project_code # Nesi project code eg nesi99999 or uoo99999
#SBATCH --time=5:00     # Walltime
#SBATCH --mem=512  # memory/node (in MB)


# example usage:
# sbatch -A nesi99999 run_print-args.sl first second third


# load in the R module
module load R/3.3.0-intel-2015a 

srun Rscript ../R/print-args.R $@ 
