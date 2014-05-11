package main

import (
	"bytes"
	"fmt"
	"log"
	"net/http"
	"os/exec"
	"runtime"
	"strings"
	"time"

	"github.com/kr/pretty"
)

const workers_num = 1000
const tgt_host, tgt_port = "127.0.0.1", 80

func pp(data interface{}) {
	fmt.Printf("%# v", pretty.Formatter(data))
}

func compose_url(tgt_addr string, tgt_port int) string {
	return fmt.Sprintf("http://%s:%d", tgt_addr, tgt_port)
}

func remote_deal(dst_addr string) {
	// Close TCP connection on each request
	for {
		//http.Get("http://127.0.0.1:80")
		_, err := http.Get(dst_addr)
		if err != nil {
			log.Fatal(err)
		}
	}
}

func remote_deal_reuse(dst_addr string) {
	// Create isingle persistent TCP connection,
	// use it in each interaction.

	//res, _ := client.Do(req)
	//io.Copy(ioutil.Discard, res.Body)
	//res.Body.Close()
	//
	//To ensure http.Client connection reuse be sure to do two things:
	//
	//Read until Response is complete (i.e. ioutil.ReadAll(resp.Body))
	//Call Body.Close()

	for {
		//http.Get("http://127.0.0.1:80")
		_, err := http.Get(dst_addr)
		if err != nil {
			log.Fatal(err)
		}
	}
}

func get_uname() string {
	cmd := exec.Command("uname", "-sr")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
	return strings.Trim(out.String(), "\n")
}

func main() {
	cpu_num := runtime.NumCPU()
	runtime.GOMAXPROCS(cpu_num)

	dst := compose_url(tgt_host, tgt_port)

	log.Printf("Runtime: %s / golang %s / cores count %d", get_uname(), runtime.Version(), cpu_num)
	log.Printf("Target addr: %s", dst)

	//response, err := http.Get("http://golang.org")

	for i := 0; i < workers_num; i++ {
		//log.Printf("spawn goroutain: %d", i)
		go remote_deal(dst)
	}

	for {
		fmt.Printf(".")
		time.Sleep(1000 * time.Millisecond)
	}
}
