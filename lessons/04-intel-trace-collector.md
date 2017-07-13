# Hands-On 1: Intel Trace Analyzer and Collector
In this hands-on, we are going to collect statistics and key metrics with Intel MPI and Intel Trace Collector. If your application is already compiled with Intel MPI, we strongly suggest you to use your own code using a short test.

*Estimated time : 15 minutes*

## Requirements
Cluster account.
Laptop with SSH client.

## ToDo
Create a SSH key

```
ssh-keygen -t rsa
```

Transfer the SSH key to the cluster

```
ssh-copy-id -i ~/.ssh/id_rsa_nesi nesi.eduXX@login.uoa.nesi.org.nz
```
Connect to the login node

```
ssh nesi.eduXX@login.uoa.nesi.org.nz -X
```
The login node is not suitable for running CPU intensive codes or compile your code. In order to test the code and interact with the command line, you can use the build-sb node:

```
ssh build-sb
```
Copy the training material into your home directory:

```
cp -r /share/training/ApplicationTuning2017 $HOME
```
In the hands-on-01 folder you will find two submit script examples to collect MPI traces based on example code:
* ```Intel-Trace-Analyser-and-Collector-2017.sh```              <-- for non-instrumented code
* ```Intel-Trace-Analyser-and-Collector-instrumented-2017.sh``` <-- for instrumented code

Choose one of them, explore and modify the content of the script and submit the job. Please, note that you will take more benefits of this training if you use your own code. The test should be no longer than 15 minutes.

If you don’t have a code ready, you can use the example located in: ```$HOME/ApplicationTuning2017/Cardiac_demo``` which is a hybrid MPI/OpenMP application.

In order to build and instrument the code you will need to load the following environment:

```
ml intel/2017a
ml VTune/2017_update2
ml itac/2017.2.028
source itacvars.sh impi5
```

Move to the folder Cardiac_demo and build the example code with and without instrumentation:

### Non-instrumented
```
cd $HOME/ApplicationTuning2017
mkdir build_non-instrumented
cd build_non-instrumented
mpiicpc ../heart_demo.cpp ../luo_rudy_1991.cpp ../rcm.cpp ../mesh.cpp -g \
        -o heart_demo -O3 -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -qopenmp -parallel-source-info=2
```

### Instrumented
```
mkdir build_instrumented
cd build_instrumented
mpiicpc ../heart_demo.cpp ../luo_rudy_1991.cpp ../rcm.cpp ../mesh.cpp -tcollect -g \
        -o heart_demo -O3 -std=c++11 -qopenmp -parallel-source-info=2 \
        -D_GLIBCXX_USE_CXX11_ABI=0 $VT_ADD_LIBS
```

Using the scalability_test.sh and the following command lines, you should be able to find the most optimal combination of processes and threads to run with. 

```
cd $HOME/ApplicationTuning2017/hands-on-01
for i in 1 4 12; do sbatch --ntasks=$((48/$i)) --cpus-per-task=$i scalability_test.sh ; done
```

You can review the benchmark results here: ```$HOME/ApplicationTuning2017/OUT/benchmark-results.txt```

Once you get the best result, submit a job based on those scripts ```Intel-Trace-Analyser-and-Collector-instrumented-*.sh``` in order to collect the MPI traces.

Once the job are done, you will find the traces collected in: ```$HOME/ApplicationTuning2017/OUT/```

