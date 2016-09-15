package main

import (
    "net/http"
    "log"
    "fmt"
    "os"
    "io/ioutil"
)

func main() {
    http.HandleFunc("/getRules" ,readRules)
    log.Fatal(http.ListenAndServe(":8484", nil))
}

func readRules(w http.ResponseWriter, r *http.Request){
    file, err := os.Open("../../conf/switchy-rules.conf")
    if err != nil{
        log.Fatal(err)
    }
    defer file.Close()

    bytes, err := ioutil.ReadAll(file)
    if err != nil{
        log.Fatal(err)
    }

    fmt.Fprintf(w, string(bytes[:]))
}



