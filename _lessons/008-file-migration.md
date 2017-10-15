---
layout: post
title: HPC3 Users' data and software migration to Kupe
---


### Files migration

All FitzRoy users' files  will be migrated to Kupe where each user will have their allocated home space.

### Translating your job scheduler Load Leveler scripts to SLURM

As Kupe will use SLURM to manage submitted jobs, you will need to rewrite your scripts to make them compatible with the new job scheduler.

| LL                                                |  Slurm                                          |
|---------------------------------------------------|-------------------------------------------------|
| #@ job_name =  NAME                               | #SBATCH -J NAME
| #@ account_no = 12345                             | #SBATCH -A 12345
|
