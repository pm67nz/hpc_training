---
layout: post
title: Slurm job fairness and queue velocity
---

You will learn how to maximize queue velocity of submitted jobs.

## How SLURM works

The scheduler is fundamentally first-in-first-out. 

* If the jobs are uniform size the velocity of the jobs through the queue is uniform
* When jobs vary in size then the velocity of the jobs through the queue depends on the size of the jobs in the queue

The Slurm scheduler employs backfill which searches the queue for jobs that can run to completion while the highest priority job waits for resource to become available.  This increases the utilization but moves the jobs from first-in-first-out to a function of the workload and the job size.  With the backfill scheduler smaller jobs have a higher velocity through the queue than larger jobs. 

Slurm does not delay large jobs in favor of smaller jobs.  Fairness means all jobs are treated the same.  Fairness is inversely proportional to the variance in the job velocity. 

Slurm favors utilization over fairness.

Job size is multi-dimensional.  Four categories of job sizes may be considered,  based on

Time: long or short and
Resource request: narrow (1 or a few cores) or broad (many cores). 
The four categories are Long Narrow (LN), Short Narrow (SN), Long Broad (LB) and Short Broad (SB).  The LB jobs have the nominal queue velocity closest to first-in-first-out.  The SN jobs have the highest queue velocity.

The queue design uses limits to partition the system based on the classes of projects.  Within the class the priority is used to increase the velocity of jobs of similar size.

## Queues on Kupe

![alt text](https://github.com/nesi/hpc_training/blob/gh-pages/kupe_fairshare.png "Kupe queue structure")

Queue limits reflect the NIWA-NeSI allocation and the Merit-Collaboration allocation within the NeSI allocation.  The base allocations are NIWA-Only 36 nodes, NeSI-Merit 27 nodes and NeSI Collaborator 41 nodes.  An option to allow “NeSI” jobs to spill over into NIWA owned capacity (and vice versa) in each class offers 9 nodes for foraging.  With the foraged nodes this brings the allocations to NIWA-only to 45 nodes and NeSI-Merit 31 nodes and NeSI Collaborator 46 nodes.   To access the foraged nodes a job indicates that it can be preempted by a forage policy.  Available policies include cancel, checkpoint and requeue.

The basic queues are size neutral.  User limit cap the size of the job and steer the user toward jobs between broad and narrow.  By setting the base wall time limit to 96:00 default jobs being either LN or LB resulting in low queue velocity.   Setting a lower default wall time either in the project account or by the user results in higher job velocity.  Priority will move jobs of similar size ahead of the lower priority jobs.  The gap between the queue limit and the broadest job ensures that narrow jobs have an opportunity to run. 

**The bottom line is – it is important to request only the resources your job really needs, as this will improve the queue velocity of all jobs.**

