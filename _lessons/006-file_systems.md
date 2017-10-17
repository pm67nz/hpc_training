---
layout: post
title: HPC3 File and directory structure, and their use
---

### NeSI and NIWA research users

It is important to use the file structure according to its purpose to get best performance while ensuring that important data are not lost. 

| File Space | Backed Up | IO Bandwidth | Total Capacity        | Access   | Quota | Usage                                                    |
|------------|:---------:|:------------:|:---------------------:|:--------:|:-----:|----------------------------------------------------------|
| Home       | Yes       | Low          | Low (50 TB)           | Personal | Yes   | Documentation, source code packages, …                   |
| Project    | Yes       | Low          | Medium (300 TB)       | Group    | Yes   | Analysis results, source code, file sharing, ...         |
| Nobackup   | No        | High         | Large (2500 TB)       | Group    | Yes   | Raw model output - **old files may be "spring cleaned"** |
| Nearline   | HSM<sup>*</sup> | Very Low     | Huge (600 TB + 30 PB) | Group    | Yes   | Staging file system for tape archival of research output, no direct access |

\* HSM is the Hierarchical Storage Manager that writes data to the tape archive

There may be a spring cleaning mechanism on the "Nobackup" file system that deletes old files when space runs low. This gives users the flexibility to quickly access large amounts of space when needed. Details of the "spring cleaning" mechanism, such as deletion criteria and warning messages for users are currently being discussed.

### NIWA operational users

The file structure is completely separate to ensure performance and reliability, research users will not have access to it.

| File Space | Total Capacity |
|------------|---------------:|
| devel      | 50 TB          |
| test       | 200 TB         |
| archive    | 100 TB         |
| oper       | 400 TB         |
