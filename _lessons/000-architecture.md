---
layout: post
title: Overview of Kupe architecture
---


## Architecture

Kupe, previously known as HPC3, is a Massively Parallel Capability Computer (Supercomputer) built on the Cray XC50 platform.

#### Compute Hardware:
* 104 XC50 compute nodes
   - 2x Intel Xeon Gold 6148 2.4 GHz processor with 20 physical cores each (total of 40 physical cores per node)
   - 96 GB of RAM per node
* 11 CS500 nodes
   - Same Intel Xeon Gold 6148 SKL processor as compute nodes
   - 768 GB of RAM per node
   - 2 nodes with Nvidia Tesla P100 GPGPUs
   - Virtualised (one or more virtual machines share resources on each node)
* Storage: IBM Spectrum Scale (formerly GPFS)


If you are interested in learning more about the hardware, please find the details below.

##### More hardware details:
* 104 XC50 compute nodes
   - 2-way hyperthreading with a total of 80 logical cores per node
   - Cray Aries interconnect (low-latency network, used by MPI jobs, IO, ...)
   - 19 DVS (Data Virtualization Service) links for accessing Spectrum Scale filesystems over Cray Aries (currently no native access possible), which may limit IO performance for some jobs
   - Used only for running jobs, no direct access
   - Runs a slim version of SLES (Linux)
* 2 eLogin nodes
   - Same Intel Xeon Gold 6148 SKL processor as compute nodes (no cross-compilation needed!)
   - Native access to Spectrum Scale filesystems
   - Used for building codes, submitting jobs, ...
   - Run on a full version of SLES
* 11 CS500 nodes
   - Native access to Spectrum Scale filesystems (ideal for IO-intensive jobs)
   - 5 multi-purpose nodes for running batch jobs, e.g., preprocessing or postprocessing of HPC jobs (no interactive access)
   - 6 virtual lab nodes for interactive work with remote desktop capability
   - One multi-purpose node and one virtual lab node has a Nvidia Tesla P100 GPGPU
   - Run a full version of CentOS 7
* 4 CS400 nodes
   - Shared Service nodes with Broadwell CPUs
   - Most are not for user access
* 1 Management node with Broadwell CPUs

#### Storage
* Dedicated cluster for the Shared Service nodes
* EDR (Enhanced Data Rate) InfiniBand network for access from build nodes and multi-purpose nodes to ensure high throughput and low latency
* Cray DVS provides access to Spectrum Scale from compute nodes via the Aries interconnect

Kupe is installed in Auckland in the Tamaki Data Centre, with IBM storage over EDR IB network via
Multi-Cluster Spectrum Scale filesystems.

#### Main improvements
* Faster processors compared to those on Fitzroy or Pan
* GPGPU (General Purpose Graphical Processing Unit) nodes to support science codes and visualisation
* A Linux user environment that will make it easier to manage work, develop and run research workloads/jobs, and apply data analytics tools
* Increased storage capacity and hierarchical storage management to minimise the need to move data between the HPC storage and a user’s home institution, and underpin the new interactive data analysis services.
* Vastly increased file system performance, reducing the time spent reading and writing data to the filesystems.
* More advanced feature sets which provide more opportunities to develop faster codes.
