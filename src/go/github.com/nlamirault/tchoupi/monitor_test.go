// Copyright (c) Nicolas Lamirault

package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"net/http/httptest"
	"testing"
)

func checkResponseFormat(t *testing.T, response *httptest.ResponseRecorder, code int) {
	if response.Code != code {
		t.Fatalf("Non-expected status code %v:\n\tbody: %v",
			code,
			response.Code)
	}
	if response.HeaderMap.Get("Content-Type") != "application/json" {
		t.Fatalf("JSON content type false.")
	}
}

func readJSONResponse(t *testing.T, response *httptest.ResponseRecorder) VersionJson {
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		panic("Error during response: ")
	}
	log.Println("HTTP Response content : ", string(body))
	var msg VersionJson
	err = json.Unmarshal(body, &msg)
	if err != nil {
		panic("Can't decode JSON content")
	}
	return msg
}

func TestApiVersion(t *testing.T) {
	request, _ := http.NewRequest("GET", "/version", nil)
	response := httptest.NewRecorder()
	VersionHandler(response, request)
	checkResponseFormat(t, response, http.StatusOK)
	json := readJSONResponse(t, response)
	if json.Version != TchoupiVersion {
		t.Fatalf("Invalid JSON version.")
	}
}
