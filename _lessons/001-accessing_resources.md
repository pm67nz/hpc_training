---
layout: post
title: HPC3 - Accessing system resources
---

### Logging in for the first time

If you are logging in for the first time to Kupe, you will need to set up your password using [NeSI User Portal](https://my.nesi.org.nz/accounts).

1. Log in to the NeSI User Portal using your institutional credentials via Tuakiri.
2. Select "My account" tab.
3. Set password for Kupe (HPC3).

Connecting to the HPC requires two-factor authentication at all times, your password, and an additional factor. These additional factors can be:
- A keycode provided by Google Authenticator (via smartphone app or Chrome browser)
- Connecting from NIWA's physical network (at a NIWA branch)
- Connecting through a NIWA VPN session

You can set up Google Authenticator on the NeSI User Portal:

4. Click "Link mobile device"
5. This will open instructions for setting up Google Authenticator. Note that you will need to have a smartphone for this. If you do not have a smartphone, you can use [GAuth add-on](https://chrome.google.com/webstore/detail/ilgcnhelpchnceeipipijaljkblbcobl) for Chrome browser.




### Logging into Kupe (HPC3)

You will need a terminal program to log into Kupe:

- Windows: MobaXterm, Windows 10 bash, Putty
- MacOS X: Terminal app
- Linux: Terminal app

1. In order to log in to Kupe (HPC3), open the terminal program on your local machine and connect using `ssh`.
```
   ​ssh -X your_username@kupe.niwa.co.nz
```
If you use a MobaXterm or Putty, start a new ssh session with remote host `kupe.niwa.co.nz` and username `your_username`, and activate "X11 forwarding".

2. Enter your password (the one you set up in NeSI User Portal)

3. If you are logging in from outside of NIWA network, you will need to enter 6-digit code from the Google Authenticator which you set up (see above).

You should now see the reply from Kupe's elogin node.
