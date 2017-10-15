### Logging in for the first time

If you are logging in for the first time onto HPC3, you will need to set up your password using [NeSI User Portal](https://my.nesi.org.nz/accounts).

1. Log into the NeSi User Portal using your institutional credentials via Tuakiri.
2. Select "My account" tab.
3. Set password for Kupe (HPC3).

If you are connecting within the NIWA network, you will be able to access Kupe (HPC3) diretcly via SSH (see details below). However, if you are connecting to Kupe from outside of NIWA network (which will be the case for all non-NIWA users), you need to set up Google Authenticator which NeSI uses for the two-factor authentication system. You can do that via NeSI User Portal:

4. Click "Link mobile device"
5. This will open instructions for setting up Google Authenticator. Note that you will need to have a smartphone for this. If you do not have a smartphone, you can use [GAuth add-on](https://chrome.google.com/webstore/detail/ilgcnhelpchnceeipipijaljkblbcobl) for Chrome browser.

### Connecting via SSH

In both cases you will be accessing the cluster using `ssh` which stands for "Secure SHell" and is a program for establishing secure communication between two machines over a network.

### Generating SSH Keys

For the purpose of this workshop we will guide you through the process of logging on the supercomputers using SSH keys. Let's have a look at the [detailed guidelines for this procedure](https://wiki.auckland.ac.nz/display/CER/How+to+log+in+using+ssh+keys).

Once you generated (following the guidelines above) the SSH private/public pair key, please send the **public** key (which will be saved as a file on your disk) as an attachment to support@nesi.org.nz

If you are working on a Windows machine using MobaXTerm, your public key should be located in the file *XXX_rsa_key.pub* which should be in the following location:

```
C:\Users\your_username\Documents\MobaXterm\home\.ssh\XXX_rsa_key.pub
```

It will be the file which Windows will interpret as `Microsoft Publisher Document` (also, it should be the smaller file of the two): `XXX_rsa_key.pub`

If you are working on Linux or Mac, your public key will should be located in:

```
/home/your_username/.ssh/XXX_rsa_key.pub
```

Once you locate the file:
1. Open your email and attach the file with the **public key**.
2. In the subject of the email write "Public key for [your_username]"
3. Just in case - put in your username in the body of the email.
4. Send this email to support@nesi.org.nz


When the cluster administrators received your email with the attached public file, they will *authorise* the key and this will allow you log onto the cluster and start working in HPC environment.

**Note** Authorisation using SSH keys is a commonly used methods for many systems, not just NeSI or HPCs. For example, [GitHub uses this approach.](https://help.github.com/articles/connecting-to-github-with-ssh/)


### Actually connecting via SSH

Now, when you generated the SSH keys and sent in the public one (not the private one!) and it has been authorized by the administrator, you should be able to successfully login to the cluster:

```
​ssh -i ~/.ssh/XXX_rsa_key your_username@login.uoa.nesi.org.nz
```

As you see, we need to add a *flag* (-i) pointing out the ssh to the location of *your private key*.
