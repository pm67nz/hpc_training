---
layout: post
title: HPC3 Users' data and software migration to Kupe
---


### Files migration

All FitzRoy users' files  will be migrated to Kupe where each user will have their allocated home space.

### Translating your job scheduler Load Leveler scripts to SLURM

As Kupe will use SLURM to manage submitted jobs, you will need to rewrite your scripts to make them compatible with the new job scheduler.

Note that for the SLURM directives there must not be any space between # and SBATCH

| LL                                                |  Slurm                                          |
|---------------------------------------------------|-------------------------------------------------|
| #@ job_name =  NAME                               | #SBATCH -J NAME
| #@ account_no = 12345                             | #SBATCH -A 12345
| #@ all_clock_limit = 01:00:00                     | #SBATCH --time=01:00:00
| #@ resources = ConsumableMemory(1024mb)           | #SBATCH --mem-per-cpu=1024
| #@ output = $(job_name).$(jobid).out              | #SBATCH -o my_job-%j.%N.out
| #@ error = $(job_name).$(jobid).err               | #SBATCH -e my_job-%j.%N.out
| #@ requirements = (Feature==="build_node_name")   | #SBTACH -C build_node_name
| 
