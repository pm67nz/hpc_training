#!/bin/bash -e

#SBATCH --job-name=simplempif90
#SBATCH --time=00:01:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G

srun ../Fortran/simpleMpiF90
