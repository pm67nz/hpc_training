#Workshop setup

### Getting access to NeSI

To be able to work on NeSI clusters, you will need to get an account first. Depending on the workshop set up that you will be attending, the organisers may be able to get you to use generic training accounts. **Warning:** these training accounts, and any data associated with them, will be deleted immediately after the workshop. If you wish to continue working on your research using NeSI, you will need to apply for an account.

Please see: [NeSI website](https://www.nesi.org.nz/apply) for more details.

Once you have your account (and know your username and password), you will be able to log in. Open the terminal on your machine (for more info see below) and type in:

```
ssh your_username@@login.uoa.nesi.org.nz
```

See detailed [login instructions using MobaXTerm on Windows](https://wiki.auckland.ac.nz/display/CER/FromZeroToHero) (note that these instructions may include some details which are available if you are at the Auckland University campus). If you are using Linux, Mac OS or maybe a Unix system, you will be able to log in using a standard terminal.

If you are using NeSI Pan cluster, your username and some details related to the login steps will vary - [see for details](https://wiki.auckland.ac.nz/display/CER/Access+and+data+transfer).

When you execute the line above, you will be asked to input your password and then you should be logged in on the Pan cluster **login node**.

```
Last login: Thu Mar  9 15:38:43 2017 from it346501.uoa.auckland.ac.nz
     
      *******************************************************************
      **         Welcome to Pan, the NeSI Intel x86-64 Cluster         **
      **                                                               **
      **  This high-performance computing cluster is operated by the   **
      **  University of Auckland Centre for eResearch as part of the   **
      **             New Zealand eScience Infrastructure.              **
      **                                                               **
      *******************************************************************
       
      For a list of your current projects, run show_my_projects.
      To see your current quota usage, run fs_my_quota_usage.
      
      For documentation, visit https://wiki.auckland.ac.nz/x/CA-sAg.
      
      To build or test software, use one of the build nodes:
		ssh build-wm (Westmere)
		ssh build-sb (SandyBridge)
      
     The next outage is scheduled for 9:00 AM on Thursday 4th of May 2017.

      
[apaw363@login-01 ~]$ 
```

### Working in Unix/Linux environment

In order to use HPC resources (not only those provided by NeSI), you will almost always have to interact with it using command line. If you are not familar with it, have a look at these [Software Carpentry materials](http://swcarpentry.github.io/shell-novice/) which should help you get up to speed.

### Getting the training material

During our workshop we will use some R scripts, some SLURM scripts and some sample data.

Let's start first with changing to your project directory (as you want to keep all the above files well organised within the project directory).

```
ls /projects/your_project_name
```

