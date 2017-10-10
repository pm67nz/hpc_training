---
layout: post
title: HPC3 - Accessing system resources
---

### Logging in for the first time

If you are logging in for the first time onto HPC3, you will need to set up your password using [NeSI User Portal](https://my.nesi.org.nz/accounts).

1. Log into the NeSi User Portal using your institutional credentials via Tuakiri.
2. Select "My account" tab.
3. Set password for Kupe (HPC3).

If you are connecting within the NIWA network, you will be able to access Kupe (HPC3) diretcly via SSH (see details below). However, if you are connecting to Kupe from outside of NIWA network (which will be the case for all non-NIWA users), you need to set up Google Authenticator which NeSI uses for the two-factor authentication system. You can do that via NeSI User Portal:

4. Click "Link mobile device"
5. This will open instructions for setting up Google Authenticator. Note that you will need to have a smartphone for this. If you do not have a smartphone, you can use [GAuth add-on](https://chrome.google.com/webstore/detail/ilgcnhelpchnceeipipijaljkblbcobl) for Chrome browser.




### Logging into Kupe (HPC3)

1. In order to log into Kupe (HPC3), use `ssh` on the terminal on your local machine.

```
   ​ssh your_username@kupe.niwa.co.nz
```

2. Enter your password (the one you set up in NeSI User Portal)

3. If you are logging in from outside of NIWA network, you will need to enter 6-digit code from the Google Authenticator which you set up (see above).


### API Access

* **Elastic**
  - Elasticsearch
  [Elasticsearch API](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/docs.html)
  There is an official [Elasticsearch Python library](https://elasticsearch-py.readthedocs.io/en/master/) to work with Elasticsearch REST API

  - [Longstash Monitoring API](https://www.elastic.co/guide/en/logstash/5.0/monitoring.html)
