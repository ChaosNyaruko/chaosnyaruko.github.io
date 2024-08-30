---
layout: post
title: 
subtitle: 
date: 2024-08-30
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - Go
    - Concurrency
    - ShareMem
---

# Disclaimer
[The original post](https://go.dev/blog/codelab-share) was written by Andrew Gerrand on 13 July, 2010. 

I'm reposting it not because it's "absolutely" correct, it just offers another perspective of concurrent programming, and in **SOME** case, it might be more suitable than "sharing memory" or "mutex stuff". 

It may also help you appreciate some design philosophy of Go, and provide you with some inspiration when dealing with concurrency or other problems.

Again I'm not saying it's **BETTER**, it's just another another way of thinking and designing.


# The Post

Traditional threading models (commonly used when writing Java, C++, and Python programs, for example) require the programmer to communicate between threads using shared memory. Typically, shared data structures are protected by locks, and threads will contend over those locks to access the data. In some cases, this is made easier by the use of thread-safe data structures such as Python’s Queue.

Go’s concurrency primitives - goroutines and channels - provide an elegant and distinct means of structuring concurrent software. (These concepts have an interesting history that begins with C. A. R. Hoare’s Communicating Sequential Processes.) Instead of explicitly using locks to mediate access to shared data, Go encourages the use of channels to pass references to data between goroutines. This approach ensures that only one goroutine has access to the data at a given time. The concept is summarized in the document Effective Go (a must-read for any Go programmer):

Do not communicate by sharing memory; instead, share memory by communicating.

Consider a program that polls a list of URLs. In a traditional threading environment, one might structure its data like so:
```Go
type Resource struct {
    url        string
    polling    bool
    lastPolled int64
}

type Resources struct {
    data []*Resource
    lock *sync.Mutex
}
```
And then a Poller function (many of which would run in separate threads) might look something like this:

```Go
func Poller(res *Resources) {
    for {
        // get the least recently-polled Resource
        // and mark it as being polled
        res.lock.Lock()
        var r *Resource
        for _, v := range res.data {
            if v.polling {
                continue
            }
            if r == nil || v.lastPolled < r.lastPolled {
                r = v
            }
        }
        if r != nil {
            r.polling = true
        }
        res.lock.Unlock()
        if r == nil {
            continue
        }

        // poll the URL

        // update the Resource's polling and lastPolled
        res.lock.Lock()
        r.polling = false
        r.lastPolled = time.Nanoseconds()
        res.lock.Unlock()
    }
}
```
This function is about a page long, and requires more detail to make it complete. It doesn’t even include the URL polling logic (which, itself, would only be a few lines), nor will it gracefully handle exhausting the pool of Resources.

Let’s take a look at the same functionality implemented using Go idiom. In this example, Poller is a function that receives Resources to be polled from an input channel, and sends them to an output channel when they’re done.
```Go
type Resource string

func Poller(in, out chan *Resource) {
    for r := range in {
        // poll the URL

        // send the processed Resource to out
        out <- r
    }
}
```
The delicate logic from the previous example is conspicuously absent, and our Resource data structure no longer contains bookkeeping data. In fact, all that’s left are the important parts. This should give you an inkling as to the power of these simple language features.

There are many omissions from the above code snippets. For a walkthrough of a complete, idiomatic Go program that uses these ideas, see the Codewalk [Share Memory By Communicating](https://go.dev/doc/codewalk/sharemem/).



# For your convenience, the code in the above link
[code](https://go.dev/doc/codewalk/urlpoll.go)
```Go
// Copyright 2010 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"log"
	"net/http"
	"time"
)

const (
	numPollers     = 2                // number of Poller goroutines to launch
	pollInterval   = 60 * time.Second // how often to poll each URL
	statusInterval = 10 * time.Second // how often to log status to stdout
	errTimeout     = 10 * time.Second // back-off timeout on error
)

var urls = []string{
	"http://www.google.com/",
	"http://golang.org/",
	"http://blog.golang.org/",
}

// State represents the last-known state of a URL.
type State struct {
	url    string
	status string
}

// StateMonitor maintains a map that stores the state of the URLs being
// polled, and prints the current state every updateInterval nanoseconds.
// It returns a chan State to which resource state should be sent.
func StateMonitor(updateInterval time.Duration) chan<- State {
	updates := make(chan State)
	urlStatus := make(map[string]string)
	ticker := time.NewTicker(updateInterval)
	go func() {
		for {
			select {
			case <-ticker.C:
				logState(urlStatus)
			case s := <-updates:
				urlStatus[s.url] = s.status
			}
		}
	}()
	return updates
}

// logState prints a state map.
func logState(s map[string]string) {
	log.Println("Current state:")
	for k, v := range s {
		log.Printf(" %s %s", k, v)
	}
}

// Resource represents an HTTP URL to be polled by this program.
type Resource struct {
	url      string
	errCount int
}

// Poll executes an HTTP HEAD request for url
// and returns the HTTP status string or an error string.
func (r *Resource) Poll() string {
	resp, err := http.Head(r.url)
	if err != nil {
		log.Println("Error", r.url, err)
		r.errCount++
		return err.Error()
	}
	r.errCount = 0
	return resp.Status
}

// Sleep sleeps for an appropriate interval (dependent on error state)
// before sending the Resource to done.
func (r *Resource) Sleep(done chan<- *Resource) {
	time.Sleep(pollInterval + errTimeout*time.Duration(r.errCount))
	done <- r
}

func Poller(in <-chan *Resource, out chan<- *Resource, status chan<- State) {
	for r := range in {
		s := r.Poll()
		status <- State{r.url, s}
		out <- r
	}
}

func main() {
	// Create our input and output channels.
	pending, complete := make(chan *Resource), make(chan *Resource)

	// Launch the StateMonitor.
	status := StateMonitor(statusInterval)

	// Launch some Poller goroutines.
	for i := 0; i < numPollers; i++ {
		go Poller(pending, complete, status)
	}

	// Send some Resources to the pending queue.
	go func() {
		for _, url := range urls {
			pending <- &Resource{url: url}
		}
	}()

	for r := range complete {
		go r.Sleep(pending)
	}
}
```

