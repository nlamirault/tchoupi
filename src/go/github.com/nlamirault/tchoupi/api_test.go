// Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
// 02110-1301, USA.

package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func checkResponseFormat(t *testing.T, response *httptest.ResponseRecorder, code int) {
	if response.Code != code {
		t.Fatalf("Non-expected status code %v:\n\tbody: %v",
			code,
			response.Code)
	}
	fmt.Printf("Content type: %s", response.HeaderMap.Get("Content-Type"))
	fmt.Println(strings.Contains(response.HeaderMap.Get("Content-Type"),
		"application/json"))
	if !strings.Contains(response.HeaderMap.Get("Content-Type"),
		"application/json") {
		t.Fatalf("JSON content type false. : %s",
			response.HeaderMap.Get("Content-Type"))
	}
}

func readJSONResponse(t *testing.T, response *httptest.ResponseRecorder) Version {
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		panic("Error during response: ")
	}
	log.Println("HTTP Response content : ", string(body))
	var data Version
	err = json.Unmarshal(body, &data)
	if err != nil {
		panic("Can't decode JSON content")
	}
	fmt.Printf("Response: %s", data)
	return data
}

func testRequest(method, path string) (*httptest.ResponseRecorder, *http.Request) {
	request, _ := http.NewRequest(method, path, nil)
	response := httptest.NewRecorder()
	return response, request
}

func TestApiVersion(t *testing.T) {
	app := Server()
	response, request := testRequest("GET", "/version")
	app.ServeHTTP(response, request)
	checkResponseFormat(t, response, http.StatusOK)
	version := readJSONResponse(t, response)
	if version.Name != TchoupiVersion {
		t.Fatalf("Invalid JSON version.")
	}
}
