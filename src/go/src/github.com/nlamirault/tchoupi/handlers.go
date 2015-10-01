// Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
	"log"
	"net/http"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

// WebService represents the Restful API
type WebService struct{}

// APIVersion represents version of the REST API
type APIVersion struct {
	Version string `json:"version"`
}

// NewWebService creates a new WebService instance
func NewWebService() *WebService {
	log.Printf("[DEBUG] Creates webservice")
	return &WebService{}
}

// Help send a message in JSON
func (ws *WebService) Help(c *echo.Context) error {
	return c.String(http.StatusOK,
		"Welcome to Tchoupi\n")
}

// DisplayAPIVersion sends the API version in JSON format
func (ws *WebService) DisplayAPIVersion(c *echo.Context) error {
	return c.JSON(http.StatusOK, &APIVersion{Version: "1"})
}

// GetWebService return a new gin.Engine
func GetWebService() *echo.Echo {
	log.Printf("[DEBUG] Creating web service")
	ws := NewWebService()
	e := echo.New()
	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	// Routes
	e.Get("/", ws.Help)
	e.Get("/version", ws.DisplayAPIVersion)
	return e
}
