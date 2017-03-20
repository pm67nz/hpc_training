## Getting access on NeSI Pan cluster

For the purpose of this workshop, you will be using a NeSI cluster called Pan which is physically located at the University of Auckland. It in fact does not make any particular difference where the machine is located. You can access it remotely, from New Zealand as well as from outside of the country (and we will show you how to do that). However, we need you to [read and acknowledge the IT usage policy issued by the University of Auckland](https://www.auckland.ac.nz/en/about/the-university/how-university-works/policy-and-administration/computing/use/it-acceptable-use-policy.html).

In other words, please use the cluster only for its intended use (i.e. research) and do not try to hack anything. You will be caught!
 
### Connecting via SSH

Depending on the setup for the training workshop you will be given either a generic training account (which will become inactive after the workshop) or you will be able to use your own account (if you already have it). In both cases you will be accessing the cluster using `ssh` which stands for "Secure SHel" and is a program for establishing secure communication between two machines over a network (nowadays, most often, over the Internet).




### Generating SSH Keys

For the purpose of this workshop we will guide you through the process of logging on the cluster using SSH keys. Let's have a look at the [detailed guidelines for this procedure](https://wiki.auckland.ac.nz/display/CER/How+to+log+in+using+ssh+keys).

Once you generated (following the guidelines above) the SSH private/public pair key, please send the **public** key (which will be saved as a file on your disk) as an attachment to support@nesi.org.nz

If you are working on a Windows machine using MobaXTerm, your public key should be located in:

```
C:\Users\your_username\Documents\MobaXterm\home\.ssh
```

It will be the file which Windows will interpret as `Microsoft Publisher Document` (also, it should be the smaller file of the two): `pan_rsa_key.pub`

If you are working on Linux or Mac, your public key will should be located in:

```
/home/aleksandra/.ssh/pan_rsa_key.pub
```
When the cluster administrators received your email with the attached public file, they will *authorise* the key and this will allow you log onto the cluster and start working in HPC environment.

**Note** Authorisation using SSH keys is a commonly used methods for many systems, not just NeSI or HPCs. For example, [GitHub uses this approach.](https://help.github.com/articles/connecting-to-github-with-ssh/)


### Actually connecting via SSH

Now, when you generated the SSH keys and sent in the public one (not the private one!) and it has been authorized by the administrator, you should be able to successfully login to the cluster:

```
​ssh -i ~/.ssh/pan_rsa_key your_username@login.uoa.nesi.org.nz
``` 

As you see, we need to add a *flag* (-i) pointing out the ssh to the location of *your private key*.



