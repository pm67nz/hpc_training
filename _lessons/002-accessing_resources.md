---
layout: post
title: HPC3 - Accessing system resources
---

### Logging in for the first time

If you are logging in for the first time to Kupe, you will need to set up your password using [NeSI User Portal](https://my.nesi.org.nz/accounts).

1. Log in to the NeSI User Portal using your institutional credentials via Tuakiri.
2. Click on "Account" link in the top-right corner.
3. Set password for Kupe (HPC3).

Connecting to the HPC requires two-factor authentication at all times, your password, and an additional factor. These additional factors can be:
- A keycode provided by an external generator (e.g., via smartphone app)
- Connecting from NIWA's physical network (at a NIWA branch)
- Connecting through a NIWA VPN session

### Logging into Kupe (HPC3)

You will need a terminal program to log into Kupe:

- Windows: MobaXterm, Windows 10 bash, Putty
- MacOS X: Terminal app, iTerm2
- Linux: Terminal app

1. In order to log in to Kupe (HPC3), open the terminal program on your local machine and connect using `ssh`.
```
   ​ssh -X your_username@kupe.niwa.co.nz
```
If you use MobaXterm or Putty, start a new ssh session with remote host `kupe.niwa.co.nz` and username `your_username`, and activate "X11 forwarding".

2. Enter your password (the one you set up in NeSI User Portal)

3. If you are logging in from outside of NIWA network, you will need to enter the additional keycode.

You should now see the reply from Kupe's elogin node.

Proceed to the temporary ```transit``` directory before changing or running anything on Kupe:
```
cd /transit/your_username
```

**Please do not create or modify any files or directories in your home directory or in any of the directories that were migrated from FitzRoy - synchronisation between FitzRoy and Kupe is still ongoing, and modified files on Kupe will be overwritten!**
