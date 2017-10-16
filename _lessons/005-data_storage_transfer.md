---
layout: post
title: HPC3 Data storage and transfer
---

### Data storage
Data storage is provided by IBM Spectrum Scale.

A dedicated cluster is reserved for the Shared Service nodes.

### Data transfer

Data transfer is available via SecureCopy `scp` for small-sized data.

For large-size data users can use Globus.

#### Globus API
Globus provides an API for efficient and secure data transfer:

 * [Globus Auth](https://docs.globus.org/api/auth/)
 * [Globus Transfer API](https://docs.globus.org/api/transfer/)

Globus provides a [Software Development Kit (SDK) in Python to work with its API.](http://globus-sdk-python.readthedocs.io/en/latest/)
