# Hands-On 2: Intel Trace Analyzer and Collector
In this hands-on, we are going to analise the traces collected in the previous hands-on session with Intel Trace Analyzer.

*Estimated time : 15 minutes*

## Requirements
* Cluster account.
* Laptop with SSH client.

## ToDo
Login to build-sb from the login node with the following command line:

```
ssh build-sb -X
```

Load the following user environment:

```
ml intel/2017a
ml VTune/2017_update2
ml itac/2017.2.028
source itacvars.sh impi5
```

Move to folder where the traces had been collected and open the trace file with:

```
cd $HOME/ApplicationTuning2017/OUT/XXXXXX
traceanalyzer ./heart_demo.single.stf &
```

Where ```XXXXXXX``` is the JobID of the jobs which collected the traces

Explore the result data analysing:
* Event Timeline 
* Ungroup MPI Functions
* Detect Serialization in Function Profile and Message Profile
* Compare Original Trace File With Idealized Trace File
* Message Profile chart
* Explore Potential issues and suggested section of the code affected
