package main

import (
	"fmt"
	"time"
	"runtime"
	"strconv"
	"os"
)

func expensive(){
	for i := 0; i < 1000; i++ {
		for j := 0; j < 1000; j++ {
			// nothing
		}
	}
}

func loop(feedback chan int64){
        start_time := time.Now()
	var counter int64 = 0
	for {
		expensive()
		counter += 1
		if time.Since(start_time) >= (1 * time.Second){
			feedback <- counter
			start_time = time.Now()
			counter = 0
		}
	}
}

func main(){
	pid := os.Getpid()
	num_cpus := runtime.NumCPU()
        feedback_chan := make(chan int64)
	for i := 0; i < num_cpus; i++ {
		fmt.Println("Starting looper " + strconv.Itoa(i+1) + "/" + strconv.Itoa(num_cpus))
		go loop(feedback_chan)
	}
	for {
		var sum int64 = 0
		for i := 0; i < 2; i++ {
			sum += <-feedback_chan
		}
		fmt.Println("["+strconv.Itoa(pid)+"] " + strconv.FormatInt(sum, 10))
	}
}
