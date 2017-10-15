---
layout: post
title: Overview of Kupe architecture
---


## Architecture

Kupe, previously known as HPC3, is a Massively Parallel Capability Computer (Supercomputer) and built on the Cray XC50 platform.

#### Compute Hardware:
* 104 XC50 compute nodes
   - 2x Intel Xeon Gold 6148 2.4 GHz processor with 20 physical cores each
* 11 CS500 nodes
   - Same Intel Xeon Gold 6148 SKL processor as compute nodes
* Storage: IBM Spectrum Scale (formerly GPFS)


If you are interested in learning more about the hardware, please find the details below.

##### More hardware details:
* 104 XC50 compute nodes
   - 2x Intel Xeon Gold 6148 2.4 GHz processor with 20 physical cores each (thus a total of 40 physical cores)
   - 2-way hyperthreading with a total of 80 logical cores per node
   - Cray Aries interconnect (low-latency network, used by MPI jobs, IO, ...)
   - 19 DVS (Data Virtualization Service) links for accessing Spectrum Scale filesystems over Cray Aries (currently no native access possible), which may limit IO performance for some jobs
   - Used only for running jobs, no direct access
   - Run on a slim version of SLES (Linux)
* 2 eLogin nodes
   - Same Intel Xeon Gold 6148 SKL processor as compute nodes (no cross-compilation needed!)
   - Native access to Spectrum Scale filesystems
   - Lots of memory
   - Used for building codes, submitting jobs, ...
   - Run on a full version of SLES
* 11 CS500 nodes
   - Same Intel Xeon Gold 6148 SKL processor as compute nodes (no cross-compilation needed!)
   - Some nodes include a Nvidia Tesla P100 GPGPU
   - Native access to Spectrum Scale filesystems (ideal for IO-intensive jobs)
   - Multi-Purpose nodes for running batch jobs, e.g., preprocessing or postprocessing of HPC jobs (no interactive access)
   - Virtual Lab nodes for interactive work with remote desktop capability
   - Nodes will be accessible as virtual machines
   - Run a full version of CentOS 7
* 4 CS400 nodes
   - Shared Service nodes with Broadwell CPUs
   - Most are not for user access
* 1 Management node with Broadwell CPUs
* Multipurpose nodes
   - non-interactive worker nodes for batch processing of data as part of pre-processing and post-processing jobs for the HPC
* VirtualLab nodes
   - interactive environments, persistent virtual workstations, with access to the shared storage
   - enable job submission to the Multi-Purpose nodes and the local HPC(s)
   - controlled by NIWA.

#### Storage
* Dedicated cluster for the Shared Service nodes
* EDR (Enhanced Data Rate) InfiniBand network for access from build nodes and multi-purpose nodes to ensure high throughput and low latency
* Cray DVS provides access to Spectrum Scale from compute nodes via the Aries interconnect

Kupe is installed in Auckland in the Tamaki Data Centre, with IBM storage over EDR IB network via
Multi-Cluster Spectrum Scale filesystems.

#### Main improvements
* Faster processors so current work is done faster.
* GPGPU (General Purpose Graphical Processing Unit) nodes to support science codes and visualisation
* A Linux user environment that will make it easier to manage work, develop and run research workloads/jobs, and apply data analytics tools.
* Increased storage capacity and hierarchical storage management to minimise the need to move data between the HPC storage and a user’s home institution, and underpin the new interactive data analysis services.
* Vastly increased file system performance reducing the time spent reading and writing data to the filesystems.
* More advanced feature sets which provide more opportunities to develop faster codes.
