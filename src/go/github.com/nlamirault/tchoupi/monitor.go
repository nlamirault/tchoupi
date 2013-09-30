// Copyright (c) Nicolas Lamirault

package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type VersionJson struct {
	Version string
}

func sendResponse(rw http.ResponseWriter, data string) {
	log.Println("[Tchoupi] Response: ", data)
	fmt.Fprintf(rw, "%s", data)
}

func handler(rw http.ResponseWriter, r *http.Request) {
	sendResponse(rw, "Tchoupi")
}

func VersionHandler(rw http.ResponseWriter, r *http.Request) {
	log.Println("[Tchoupi] /version ", r.URL.Path[1:])
	rw.Header().Set("Content-Type", "application/json")
	msg := VersionJson{Version: TchoupiVersion}
	b, err := json.Marshal(msg)
	if err != nil {
		panic("Can't encode JSON content")
	}
	sendResponse(rw, string(b))
}

func main() {
	//defer log.Flush()
	log.Println("[Tchoupi] Start")
	http.HandleFunc("/", handler)
	http.HandleFunc("/version", VersionHandler)
	http.ListenAndServe(":8085", nil)
}
