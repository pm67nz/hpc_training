## Working within NeSI HPC environment

NeSI clusters are a shared resource and hence there are certain rules as to what is available to each user by default. For small-scale projects the default amount of resources should be sufficient. If you need more compute power or disk allocation for your data, please contact support@nesi.org.nz.

### Quota

On the NeSI Pan cluster the basic quota rules are (in brief summary):

* Every file, directory or symbolic link takes up either 32 KB of disk space or its actual size, whichever is bigger.

* Every file, directory or symbolic link counts for one "inode".

* Your home directory has a disk space allotment of 2 GB (though we can give more home directory space in exceptional circumstances).


* Each project directory starts off with a space allotment of 30 GB and an inode allotment of 1,000,000 inodes, unless more space is requested (and agreed to by us) at the time the project is created.

* An increase in disk quota or inode quota can be given either until a specific date (provided the project keeps going until that date), or until the end of the project. Especially in the latter case, we may have to reduce your disk quota if we face operational constraints.

[See more details about the quota for the Pan cluster](https://wiki.auckland.ac.nz/display/CER/Projects+and+quota)

To check your allocated disk space and file count quotas use:

```
fs_my_quota_usage
```

### Login vs build vs compute nodes

A typical cluster consists of several "parts". To simplyfy things we will briefly describe the three types of nodes that are usually available.
 In order to efficiently use HPC resources for your research, you do not need to know a lot of detail about the HPC architecture but you need to have a basic understanding of what you can use each type of node for.

* **Login Node**

- Used to access the cluster
- There usually are several login nodes - depending on the size and architecture of the cluster
- You have your home and project directories on the login node
- You upload your data and the code to the login node
- You download the results from the login node
- You submit the jobs from the login node


IMPORTANT: **Login nodes should never be used to: build and test your code, store large data files, store data permanently/long-term**

What does that actually mean?

* When on login node you should only submit jobs (aka run code) using the job scheduler. If you want to work intearactively (for example, running your code directly), you should do that drom the build node (see below).
* You should not try to edit large (probably more than 1GB) files when on the login node using standard editors (like Vim or Nano). If you need to preview a file, use `less` command.
* You should not compress a large file with gzip.


* **Build or Development Node**

- Used for building (compiling) your code
- Used for test runs for your code
- [More details on building your code on the Pan cluster](https://wiki.auckland.ac.nz/display/CER/Developing+software)
- Pan has two build nodes:
    -  build-wm   (Intel Westmere, NVIDIA Fermi)
    -  build-sb (Intel Sandy Bridge, NVIDIA Kepler)

To connect from the login node to a build node:

```
ssh -YC  build-wm
```

The -Y option makes X forwarding. This mean that any GUI applications running on the cluster can have windows output on your screen. It should be enabled by default if you are connecting to HPC from Linux. If you are on a Mac, you may need to install an X server (for example, [XQuartz](http://xquartz.macosforge.org/landing/)) 

* **Compute Node**

- This is where your jobs actually run.
- Usually you don't have to worry about working with the compute nodes as a user


### Your projects and allocation

There are several ways to check which projects you have access to. The simplest way is:

```
show_my_projects
```

You can do that using the `id` command. The output may be for example:

```
uid=6157(apaw363) gid=5000(nesi) groups=5000(nesi),6075(nesi00357) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

To check how much allocation you have used so far:

```
fs_my_quota_usage
```





### Available software

You can use a variety of software already installed on the cluster. 



### Modules


