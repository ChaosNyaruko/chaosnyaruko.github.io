---
layout: post
title: How to measure execution time of function in golang, excluding waiting time
subtitle: 
date: 2024-08-30
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - Go
    - CPU-time
---

# Two ways from StackOverflow
## Builtin Way Using "syscall"
```Go
func GetCPU() int64 {
    usage := new(syscall.Rusage)
    syscall.Getrusage(syscall.RUSAGE_SELF, usage)
    return usage.Utime.Nano() + usage.Stime.Nano()
}
```
**Explanation**  
Utime: user CPU time  
Stime: system CPU time  
RUSAGE_SELF: means it's measuring the "calling" process  

`man 2 getrusage` for more information

**NOTE**:
> The documentation for syscall.Timeval suggests that Nano() returns the time in nanoseconds since the Unix epoch, but in my tests and looking at the implementation it appears actually to return just the CPU time in nanoseconds, not in nanoseconds since the Unix epoch.

## Using CGO
Do it in a platform-specific way.

`man 3 clock_gettime`

Similarly you can use `CLOCK_PROCESS_CPUTIME_ID` to measure process CPU time and `CLOCK_MONOTONIC` for elapsed time.
```Go
package main

/*
#include <pthread.h>
#include <time.h>
#include <stdio.h>

static long long getThreadCpuTimeNs() {
    struct timespec t;
    if (clock_gettime(CLOCK_THREAD_CPUTIME_ID, &t)) {
        perror("clock_gettime");
        return 0;
    }
    return t.tv_sec * 1000000000LL + t.tv_nsec;
}
*/
import "C"
import "fmt"
import "time"

func main() {
    cputime1 := C.getThreadCpuTimeNs()
    doWork()
    cputime2 := C.getThreadCpuTimeNs()
    fmt.Printf("CPU time = %d ns\n", (cputime2 - cputime1))
}

func doWork() {
    x := 1
    for i := 0; i < 100000000; i++ {
        x *= 11111
    }
    time.Sleep(time.Second)
}
```

# Further Reading
## Using third-party-extended-pprof tools: fgprof
The Builtin Go toolchain profilers that are often used to profile CPU measures "on-CPU" only, so there is an "extend" version [fgprof](https://github.com/felixge/fgprof) on Github

```Go
package main

import(
	_ "net/http/pprof"
	"github.com/felixge/fgprof"
)

func main() {
	http.DefaultServeMux.Handle("/debug/fgprof", fgprof.Handler())
	go func() {
		log.Println(http.ListenAndServe(":6060", nil))
	}()

	// <code to profile>
}
```

```bash
go tool pprof --http=:6061 http://localhost:6060/debug/fgprof?seconds=3
```

## References
1. https://stackoverflow.com/questions/55990074/how-to-measure-execution-time-of-function-in-golang-excluding-waiting-time
2. https://github.com/felixge/fgprof
