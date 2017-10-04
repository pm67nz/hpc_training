---
layout: post
title: HPC3 Differences between HPC3 and DevSys
---

HPC3 will have Skylake processors everywhere (at least on user-facing systems), while the dev system has Broadwell processors on the clogin (used for builds) and elogin nodes, requiring users to “cross-compile” for Skylake – cross-compiling causes problems with some build systems, but this will go away

The HPC3 elogin nodes (used for builds), virtual labs, and multi-purpose nodes will have native GPFS, while the clogin node that is used for builds on the dev system has Cray’s DVS – the latter caused trouble with HDF5 and netCDF4.
