---
layout: post
title: HPC3 Available software
---

### Architectures

Kupe consists of nodes with two different architectures and operating systems:

* XC50 compute nodes that run a slim version of SLES (SUSE Linux Enterprise Server)
* Virtualised CS500 nodes that run a full version of CentOS

NeSI and NIWA will offer separate software stacks, due to different installation and maintenance policies. The NIWA software stack will mostly be used by NIWA's forecasting operations, while the NeSI software stack is for general use.

The software stack loosely falls into different categories, such as tools, general scientific libraries, or libraries that will be used with large codes (which typically have Fortran bindings and are therefore compiler-dependent).

Due to the different operating systems and runtime resource constraints (available cores, memory, IO bandwidth; see previous lesson), software will typically be built for either the XC50 or CS500 platform. Each platform supports the Cray, Intel and GNU compilers (Fortran, C and C++). Some packages will be built using a single (default) compiler while some will be built using multiple compilers, depending on context. For instance, tools and C libraries will likely be built with the GNU compiler whereas Fortran libraries might be built using multiple compilers.

| Type                                      | Default Compiler | XC50 (SLES)        | CS500 (CentOS)     |
|-------------------------------------------|------------------|:------------------:|:------------------:|
| Tools (e.g., NCL, gnuplot)                | GNU              |                    | :heavy_check_mark: |
| General scientific libraries (e.g., GDAL) | GNU              |                    | :heavy_check_mark: |
| Libraries for large codes (e.g., XIOS)    | Cray, Intel, GNU | :heavy_check_mark: |                    |

### Modules

Most software packages installed on FitzRoy will be available on Kupe (HPC3) using [Lmod](https://lmod.readthedocs.io/en/latest/) modules. Using Lmod is largely the same as using the traditional environment modules, but Lmod has a few additional tricks.

A list of available software can be obtained with the 
```
module avail 
```
command. This will bring up software provided by Cray, and additional modules provided by NeSI or NIWA. You can also find out which variants of a particular module exist using
```
module avail <module name>
```
To get a list of modules that you are currently using, type
```
module list
```
To get information about a particular module, use
```
module help <module name>
module show <module name>
```
To find all modules that, e.g., have "python" in their name, use
```
module spider python
```

Scientific software packages that have been migrated or installed so far include:

* Anaconda Python
* SpecFEM
* Data processing and visualisation: NCL, NCO, CDO, NCView, um2netcdf, IRIS, xconv, gnuplot
* Libraries: ESMF, XIOS, GDAL, GEOS, PROJ, HDF-EOS

### Requesting software installation
If you need a software package and it is not installed on Kupe, please email support@nesi.org.nz. If the software can be compiled on Kupe, runs there and there are no licensing restrictions, we will make every effort to install the software within days. Occasionally, we may need more time to investigate the licensing set up (for example, if the licensing server is provided through your organisation.)
