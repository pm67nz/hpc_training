---
layout: post
title: Fitzroy to Kupe migration
---


### Files migration

All FitzRoy users' files  will be migrated to Kupe where each user will have their allocated home space.

### Translating your job scheduler Load Leveler scripts to SLURM

As Kupe will use SLURM to manage submitted jobs, you will need to rewrite your scripts to make them compatible with the new job scheduler.

| LoadLeveler                                       |  Slurm                                          |
|---------------------------------------------------|-------------------------------------------------|
| llsubmit <script>                                 | sbatch <script>
| llcancel <job_id>                                 | scancel <job_id>
| llq -u <username>                                 | squeue -u <username> 
|---------------------------------------------------|-------------------------------------------------|                                      
| #@ job_name = <job_name>                          | #SBATCH -J <job_name>
| #@ account_no = <account_no>                      | #SBATCH -A <account_no>
| #@ wall_clock_limit = <hh:mm:ss>                  | #SBATCH -t <hh:mm:ss>
| #@ output = <output_file>                         | #SBATCH -o <output_file>
| #@ error = <error_file>                           | #SBATCH -e <error_file> 
| #@ class = <partition>                            | #SBTACH -q <partition> 
| #@ resources = ConsumableMemory(<mem>gb)          | #SBTACH --mem-per-cpu=<mem>gb
| #@ nodes = <no_nodes>                             | #SBATCH -N <no_nodes>                         
| #@ tasks_per_node = <ranks>                       | #SBATCH --tasks-per-node = <ranks>
| #@ parallel_threads = <no_threads>                | #SBATCH --cpus-per-task = <no_threads>
| #@ node_usage = not_shared                        | #SBATCH --exclusive
| #@ network.MPI = <mpi_settings>                   |
| #@ job_type = parallel                            |               
| #@ queue                                          |
|---------------------------------------------------|-------------------------------------------------|
| $LOADL_STEP_INITDIR                               | $SLURM_SUMBIT_DIR
| $LOADL_PROCESSOR_LIST                             | $SLURM_JOB_NODELIST 
                 
