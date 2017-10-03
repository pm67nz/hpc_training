---
layout: post
title: Overview of Kupe (HPC3) architecture
---


## Architecture

Kupe is a Massively Parallel Capability Computer (Supercomputer) Cray XC50.

#### Hardware features:
* 104 compute Skylake (SKL) nodes, with 19 DVS (Data Visualisation Centre) links
   - 21 links:
      - 19 links: Persistent/Research & Operational, NearLine storage
      - 2 links: 2 CDL servers
* 2 eLogin (SKL) Build/Login nodes
      - HDD storage
* 11  CS500 Multi-Purpose nodes (including 1 P100 GPGPU)
    - 11 links:
       - 5 Multi-Purpose nodes  (including 1 P100 GPGPU)
       - 6 VirualLab nodes
    -  2 × 1.2TB of SSD storage per node
* 4 CS400 nodes Shared Service (Browadwell)
     -  2 × 1.2TB of SSD storage per node
* 1 Management node (Broadwell)

#### Hardware details:
* Multipurpose nodes
   - non-interactive worker nodes for batch processing of data as part of pre-processing and post-processing jobs for the HPC
* VirtualLab nodes
   - interactive environments, persistent virtual workstations, with access to the shared storage
   - enable job submission to the Multi-Purpose nodes and the local HPC(s)
   - controlled by NIWA.

#### Storage
* IBM Spectrum Scale
* dedicated cluster for the Shared Service nodes
* EDR (Enhanced Data Rate) InfiniBand network to ensure high throughput and low latency

Kupe is installed in Auckland in the Tamaki Data Centre, with IBM storage over EDR IB network via
Multi-Cluster Spectrum Scale filesystems.

#### Main improvements
* Faster processors so current work is done faster.
* GPGPU (General Purpose Graphical Processing Unit) nodes to support science codes and visualisation
* A user environment that will make it easier to manage work, develop and run research workloads/jobs, and apply data analytics tools.
* Increased storage capacity and hierarchical storage management to minimise the need to move data between the HPC storage and a user’s home institution, and underpin the new  interactive data analysis services.
* Vastly increased file system performance reducing the time spent reading and writing data to the filesystems.
* More advanced feature sets which provide more opportunities to develop faster codes.
