// Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"flag"
	"fmt"
	"log"

	"github.com/labstack/echo/engine/standard"

	"github.com/nlamirault/tchoupi/api"
	"github.com/nlamirault/tchoupi/logging"
	"github.com/nlamirault/tchoupi/version"
)

var (
	port           string
	debug          bool
	displayVersion bool
	backend        string
	backendURL     string
	dataDir        string
	username       string
	password       string
)

func init() {
	// parse flags
	flag.BoolVar(&displayVersion, "version", false, "print version and exit")
	flag.BoolVar(&displayVersion, "v", false, "print version and exit (shorthand)")
	flag.BoolVar(&debug, "d", false, "run in debug mode")
	flag.StringVar(&port, "port", "8080", "port to use")
	flag.Parse()
}

func main() {
	if displayVersion {
		fmt.Printf("Tchoupi v%s\n", version.Version)
		return
	}
	if debug {
		logging.SetLogging("DEBUG")
	} else {
		logging.SetLogging("INFO")
	}

	var auth *api.Authentication
	log.Printf("%s %s", username, password)
	if len(username) > 0 && len(password) > 0 {
		auth = &api.Authentication{
			Username: username,
			Password: password,
		}
	}
	ws := api.GetWebService(auth)
	if debug {
		ws.Debug()
	}
	log.Printf("[INFO] Launch on %s", port)
	ws.Run(standard.New(fmt.Sprintf(":%s", port)))
}
