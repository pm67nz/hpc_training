---
layout: post
title: HPC3 Differences between HPC3 and DevSys
---

If you worked on the XC50 development systen, you will find that a few things are different on Kupe:

1. The `clogin` node on the dev machine has a Broadwell CPU. This requires users to "cross-compile" for Skylake to get best performance, but the resulting code does not run on the `clogin` node - it either crashes with an "illegal instruction" error, or with an error message if it was compiler with the Intel compilers. This can be problematic for some build systems that run small test executables during the build process. Kupe has an `elogin` node with a Skylake CPU that no longer requires cross-compilation.

2. Kupe has multi-purpose nodes and virtual lab nodes, all equipped with Skylake processors. These do not exist on the development system.

3. The `clogin` node on the development system does not have native Spectrum Scale access, but uses Cray DVS instead. This leads to somewhat lower IO performance, and it causes a problem when writing HDF5 format files (which includes netCDF4 format) due to an unsupported file locking mechanism. The `elogin`, multi-purpose, and virtual lab nodes all have native Spectrum Scale access. However, keep in mind that any code that runs on Kupe's XC50 compute nodes will still use Cray DVS (there are workarounds for the HDF5 problem).

You will also find that many things are the same:

1. Kupe uses the same programming environment as the development system
2. The XC50 compute nodes on Kupe and on the development system are exactly the same
3. Both machines use global file systems
