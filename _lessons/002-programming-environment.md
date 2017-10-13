---
layout: post
title:  HPC3 Programming Environment
---

Please use `git clone` to download this repository, if you want to try out compiling codes yourself:

```
git clone https://github.com/nesi/hpc_training.git
```

Then go to the `code` directory:

```
cd hpc_training/code
```

There are further subdirectories with the different examples that will be shown in this session.

### Targeting a CPU

A CPU target should be loaded before building any code. This means that you instruct the compiler to use instructions that are understood by this particular CPU (or a younger CPU in the same family, such as Intel's x86 CPUs). Otherwise you will see a warning message from the Cray compiler driver whenever you try to compile code. Although the compilers will still work, the resulting code is not optimised for the Skylake processor. So be sure to load
```
module load craype-x86-skylake
```
The resulting executable will not run on older processors, such as the Broadwell family which is used for the upcoming HPC1. Codes will either crash with an "illegal instruction" error, or display an error message if built with an Intel compiler.

### Compiler Wrappers

Cray provides compiler wrappers, which should be used to compile Fortran, C, and C++ code:

```
ftn -o simpleMpiF90 simpleMpi.f90 # compile Fortran code
cc -o simpleMpiC simpleMpi.c      # compile C code
CC -o simpleMpiCxx simpleMpi.cxx  # compile C++ code
```

Note that these wrappers are always the same, regardless of your choice of compiler (Cray, Intel, or GNU). The wrappers will ensure correct linking of your code with compiler runtime libraries, and with Cray-supported libraries (such as Cray's `libsci` scientific library, or netCDF). We will get to that topic later in this session.

There is also no need to invoke special compilers for MPI code or to apply special compiler options for code with OpenMP directives - use ftn, cc, and CC in all cases. 

### Programming environments

The default programming environment provides Cray's CCE (Cray Compiler Environment) for Fortran, C, and C++. However, other compilers can also be selected using

```
module swap PrgEnv-cray PrgEnv-intel
```
to use the Intel compilers, or
```
module swap PrgEnv-cray PrgEnv-gnu
```
to use the GNU compilers.

You should always invoke the ```ftn```, ```cc``` and ```CC``` compiler wrappers to ensure correct linking, regardless of the programming environment.

Note that swapping programming environments will automatically swap Cray-provided libraries - but this will **not** be the case for libraries provided by NeSI or NIWA.

### Common compiler options

Although the compiler drivers have a few options of their own, they will pass through any compiler options you set - this means that you simply set the exact same options that you would have used with the underlying compiler. For example, if you are using the `gfortran` compiler and wanted to activate compiler warnings and compiler optimisation, you would use the following command:

```
ftn -Wall -O2 -o simpleMpiF90 simpleMpi.f90
```

To see the compiler options that are specific to a compiler, type
```
man crayftn
man icc
man g++
```
for instance - don't forget to to load the corresponding programming environment first.

The wrappers provide their own options, and a few options that are common accross programming environments. You can look at them using
```
man ftn
man cc
man CC
```


### Linking against an external library

Three different cases need to be considered for linking your code against an external library:

1. The library is provided by Cray

In this case, it is sufficient to simply load the library module before building your code,
```
module load cray-netcdf
```
for instance. The compiler drivers ensure that include files and libraries are automatically found, no paths or library flags need to be specified. Moreover, correct libraries will automatically be used when a different compiler is selected (e.g., Intel or GNU). Run
```
module avail
```
and look for modules that start with "cray-" to get a full list of Cray-provided libraries. Use Cray's libsci or Intel's MKL if you need BLAS, LAPACK, or FFT.

2. The library is provided via NeSI or NIWA

NeSI and NIWA use EasyBuild to provide additional, commonly used libraries. In many cases, loading the library module before building your code using
```
module load grib_api/1.23.1-CrayCCE-2017.06
```
for instance will suffice, if your build system picks up the include and library paths from ```CPATH``` and ```LD_LIBRARY_PATH```. You may still need to add, e.g., ```-lgrib_api``` unless your build system does this for you.

If this does not work, you may need to help things along by specifying paths yourself (see next section). Run
```
module show grib_api/1.23.1-CrayCCE-2017.06
```
for instance to find out which environment variables are set to locate the include files and library.

**Note:** Make sure that you choose the correct variant of a library, depending on your choice of compiler. This does *not* happen automatically for libraries that are provided by NeSI and NIWA, and you will also need to swap between different library variants if you swap compilers.

EasyBuild uses the following module naming conventions ("toolchain names"):
* "CrayCCE" for libraries and tools built with the Cray compilers ("PrgEnv-cray")
* "CrayIntel" for libraries and tools built with the Intel compilers ("PrgEnv-intel")
* "CrayGNU" for libraries and tools built with the GNU compilers ("PrgEnv-gnu")

3. You need to link against your own library

In this case, you will need to specify the include or Fortran module files with the ```-I``` option. Use ```-L```
to specify the location of the libraries and ```-l``` the name of the libraries. Libraries typically have the prefix ```lib``` and either ```.so``` or ```.a``` as suffix.  Do not include the lib prefix or the suffix when passing a library name to the ```-l``` option. For instance, library "A" might be called ```libA.a``` and to link against "A" you would use ```-lA```. 

You can have multiple ```-L``` and ```-l``` options. When specifying libraries with ```-l```, the order matters. Symbols are resolved from left to right; that is if library "A" depends on "B" then "A" should precede "B" (```-lA -lB```). Library "A" depends on "B" if "A" calls functions or invokes symbols that are defined in "B".

#### Example 1: Linking against NetCDF with any compiler (library provided by Cray)
```
module load cray-netcdf
ftn -o simple_xy_par_wr simple_xy_par_wr.f90
```

#### Example 2: Linking against grib_api with the Intel compiler (library provided by NeSI/NIWA)
```
module load grib_api/1.23.1-CrayIntel-2017.06
cc -o simple_grib_c_test simple_grib_c_test.c -lgrib_api
ftn -o simple_grib_fortran_test simple_grib_fortran_test.f90 -lgrib_api_f90 -lgrib_api
```

The compilers drivers default to static linking where possible, and the resulting executables will be completely self-contained if all dependencies are available as static libraries. While static linking is recommended for performance reasons, you can switch to dynamic linking by adding the ```-dynamic``` flag:
```
module load grib_api/1.23.1-CrayIntel-2017.06
ftn -dynamic -o simple_grib_fortran_test simple_grib_fortran_test.f90 -lgrib_api_f90 -lgrib_api
```
If a library is only available in a static or dynamic variant, it will be used in either case. You can check the result using the ```ldd``` command:
```
ldd simple_grib_fortran_test
```
Note that you may occasionally see a warning message of the kind:
```
/opt/cray/pe/hdf5/1.10.1.1/INTEL/16.0/lib/libhdf5.a(H5PL.o): In function `H5PL_load':
H5PL.c:(.text+0x612): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
```
This simply means that the library must be accessible at runtime despite fully static linking; this can usually be ignored.
