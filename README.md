[WIP]

[Understanding Lantency and Storage Performace](http://louwrentius.com/understanding-iops-latency-and-storage-performance.html)

* **I/O**: Transaction betwwen the application and Storage (i.e. a data request from a server to a storage system)
* **IOPS**: I/O Operations per Second   
* **Latency**: How long it takes for particular request to be responded to by storage
    * A transactuion model such as a database have relative small I/O and very high IOPS and want low latency
    * In a Backup  context I/O is large, IOPS small and latency can be longer because is not critical  


### Worloads: 

Pattern:  Random and Sequential

Pattern:  Read/Write or MIX

Operation Size: IO unit (e.g., 4KB, 64KB)

Examples:
```
Online Transational Processing Database Workload
===============================
Pattern...............Random
Operation Size........8K
R/W...................Mix 70/30
```

```
Database Backup Workload
================================
Pattern...............Sequential
Operation Size........64K
R/W...................Read
```

```
Video Workload
================================
Pattern...............Sequential
Operation Size........512K+
R/W...................MIX
```


### Experiment

DEPLOY LOCAL
DEPLOY CEPH


[Fio](https://linux.die.net/man/1/fio) is a tool that will spawn a number of threads or processes doing a particular type of I/O action.

[ConfigMap](/manifests/kubernetes/configmap.yaml)
TODO: Configmap !


TODO: Deploy Ceph-Local
TODO: expreiment details