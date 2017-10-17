---
layout: post
title: HPC3 Fitzroy to Kupe migration
---


### Files migration

All FitzRoy users' files have been migrated to Kupe, and synchronisation will continue until FitzRoy shuts down. **Important: To ensure data consistency and integrity, users must not write to the migrated file spaces listed below until synchronisation stops!** Temporary directories will be made available in the meantime. All migrated files are nonetheless available for read access.

#### Mapping of file spaces between FitzRoy and Kupe

FitzRoy data will be made available using the paths listed below.

##### Research Users

| Path on Kupe                           | Path on FitzRoy            |
|----------------------------------------|----------------------------|
| /nesi/home/\<user name>                | /hpcf/home/\<user name>    |
| /nesi/project/\<project name>          | -- no equivalent --        |
| /nesi/nobackup/\<user or project name> | /hpcf/working/\<user name> |
| -- no direct access --                 | /hpcf/data/\<user name>    |

##### Operational Users

During migration, file paths will be the same on FitzRoy and on Kupe (e.g., `/oper/ecoconnect/ecoconnect_oper`). A new model will be implemented in the near future, a recommendation is listed below.

| Path on Kupe | Path on FitzRoy                    |
|--------------|------------------------------------|
| /oper/X      | /oper/ecoconnect/ecoconnect_oper   |
| /test/X      | /test/ecoconnect/ecoconnect_test   |
| /devel/X     | /devel/ecoconnect/ecoconnect_devel |
| /admin/x     | /oper/admin/ecoconnect_admin       |

### Translating your job scheduler Load Leveler scripts to SLURM

As Kupe will use SLURM to manage submitted jobs, you will need to rewrite your scripts to make them compatible with the new job scheduler. SLURM syntax is a bit more restrictive than LoadLeveler syntax:

* For the SLURM directives there must not be any space between # and SBATCH
* SLURM directives must appear at the beginning of a submission script, otherwise they will be ignored
* There must not be white space around equal signs (e.g., `--job-name = myjob` will not work)

**Important:** Kupe uses a default stacksize of 8192 kB on the XC50 compute nodes. Make sure to increase stacksize in your submission script using the command `ulimit -s <stack size>`, your program may crash with segmentation faults otherwise. Maximum stacksize can be requested using `ulimit -s unlimited`.

#### Commands

| LoadLeveler                                       |  Slurm                                          |
|---------------------------------------------------|-------------------------------------------------|
| llsubmit <script>                                 | sbatch <script>                                 |
| llcancel <job_id>                                 | scancel <job_id>                                |
| llq -u <user_name>                                | squeue -u <user_name>                           |

#### Script directives

| LoadLeveler                                       | Slurm                                           |
|---------------------------------------------------|-------------------------------------------------|
| #@ job_name = <job_name>                          | #SBATCH --job-name=<job_name>                   |
| #@ account_no = <account_no>                      | #SBATCH --account=<account_no>                  |
| #@ wall_clock_limit = <hh:mm:ss>                  | #SBATCH --time=<hh:mm:ss>                       |
| #@ output = <output_file>                         | #SBATCH --output=<output_file>                  |
| #@ error = <error_file>                           | #SBATCH --error=<error_file>                    |
| #@ class = <class_name>                           | #SBATCH --partition=<partition_name>            |
| #@ resources = ConsumableMemory(\<mem>gb)         | #SBATCH --mem-per-cpu=\<mem>G                   |
| #@ nodes = <no_nodes>                             | #SBATCH --nodes=<no_nodes>                      |
| #@ tasks_per_node = <no_ranks>                    | #SBATCH --ntasks-per-node=<no_ranks>            |
| #@ parallel_threads = <no_threads>                | #SBATCH --cpus-per-task=<no_threads>            |
| #@ node_usage = not_shared                        | #SBATCH --exclusive                             |
| #@ requirements = (Feature==="build_node_name")   | #SBATCH --constraint=build_node_name            |
| #@ network.MPI = <network_settings>               | #SBATCH --network=<network_settings>            |
| #@ job_type = parallel                            | NA                                              |
| #@ queue                                          | NA                                              |


#### Environment variables

| LoadLeveler                                       | Slurm                                           |
|---------------------------------------------------|-------------------------------------------------|
| $LOADL_STEP_INITDIR                               | $SLURM_SUMBIT_DIR                               |
| $LOADL_PROCESSOR_LIST                             | $SLURM_JOB_NODELIST                             |

#### mpiexec command

| Fitzroy                                           | Slurm                                           |
|---------------------------------------------------|-------------------------------------------------|
| poe                                               | srun                                            |


[Download a printable cheat-sheet](https://wiki.auckland.ac.nz/download/attachments/63145549/jobdescription-LoadLevelertoSlurm.pdf?version=2&modificationDate=1395888661806&api=v2 )

### Setting up Cylc tasks for SLURM

Here is an example of a Cylc task family that can be used for submitting tasks to the SLURM scheduler.

```
    [[XC50_SLURM]]
        pre-script = "ulimit -s unlimited"
        [[[job]]]
            batch system = slurm
        [[[directives]]]
            --partition = general
            --job-name = mytestjob
            --time = 02:00:00
            --mem-per-cpu = 4G
            --nodes = 4
            --ntasks = 80
            --cpus-per-task = 2
        [[[environment]]]]
            OMP_NUMTHREADS = 2      # Needs to be set in addition to --cpus-per-task
            OMP_STACKSIZE = 1g
```
Note that Cylc does not accept directives without further parameters, such as `--exclusive``. These can be set using SLURM's environment variables as shown in the example.
