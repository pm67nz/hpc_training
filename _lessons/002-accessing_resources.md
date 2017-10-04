---
layout: post
title: HPC3 - Accessing system resources
---

You will be able to access Kupe similarily to other standard HPC resources via logging in using a terminal  on your local machine. NeSI is also offering new functionality enabling users to access selected applications and services via API. Some of that API is developed by NeSI and some ships  with installed software.

### Logging into Kupe (HPC3)

In order to log into Kupe (HPC3), use `ssh`

```
   ​ssh your_username@kupe.niwa.co.nz
```

### NeSI APIs

Users will be able to access a number of NeSI applications and services via NeSI API. NeSI Portal API allows users for detailed monitoring of use of allocated core hours, job status and so on.





### NeSI Data Transfer service - Globus
Globus used for efficient and secure data transfer provides an API for:

 * [Globus Auth](https://docs.globus.org/api/auth/)
 * [Globus Transfer API](https://docs.globus.org/api/transfer/)

Globus provides [Software Development Kit (SDK) in Python to work with its API.](http://globus-sdk-python.readthedocs.io/en/latest/)



### Other software APIs
* **FreeIPA**
The FreeIPA REST API that provides access to FreeAPI and the 389DS LDAP directory has a Python module

* **Elastic**
The Elastic range of applications Elasticsearch, Logstash and Kibana (ELK)

* **Elasticsearch**
  REST API has a Python module
