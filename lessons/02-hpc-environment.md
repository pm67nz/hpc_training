##Working within NeSI HPC environment

NeSI clusters are a shared resource and hence there are certain rules as to what is available to each user by default. For small-scale projects the default amount of resources should be sufficient. If you need more compute power or disk allocation for your data, please contact support@nesi.org.nz.

###Quota

On the NeSI Pan cluster the basic quota rules are (in brief summary):

* Every file, directory or symbolic link takes up either 32 KB of disk space or its actual size, whichever is bigger.

* Every file, directory or symbolic link counts for one "inode".

* Your home directory has a disk space allotment of 2 GB (though we can give more home directory space in exceptional circumstances).


* Each project directory starts off with a space allotment of 30 GB and an inode allotment of 1,000,000 inodes, unless more space is requested (and agreed to by us) at the time the project is created.

* An increase in disk quota or inode quota can be given either until a specific date (provided the project keeps going until that date), or until the end of the project. Especially in the latter case, we may have to reduce your disk quota if we face operational constraints.

[See more details](https://wiki.auckland.ac.nz/display/CER/Projects+and+quota)

To check your allocated disk space and file count quotas use:

```
fs_my_quota_usage
```

###Login vs build vs compute nodes

A typical cluster consists of several "parts". To simplyfy things we will briefly describe the three types of nodes that are usually available.
 In order to efficiently use HPC resources for your research, you do not need to know a lot of detail about the HPC architecture but you need to have a basic understanding of what you can use each type of node for.

* **Login Node**

- Used to access the cluster
- There usually are several login nodes - depending on the size and architecture of the cluster
- You have your home and project directories on the login node
- You upload your data and the code to the login node
- You download the results from the login node
- You submit the jobs from the login node
- IMPORTANT: **Login nodes should never be used to: build and test your code, store large data files, store data permanently/long-term **
- 

* **Building or Development Node**

- Used for building (compiling) your code
- Used for test runs for your code
- [More details on building your code on the Pan cluster](https://wiki.auckland.ac.nz/display/CER/Developing+software)

* **Compute Node**

- This is where your jobs actually run.
- Usually you don't have to worry about working with the compute nodes as a user

###Available software

###Modules
