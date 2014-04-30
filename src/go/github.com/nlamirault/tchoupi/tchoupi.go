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
	//	"log"
	"net/http"
	"regexp"
	"strings"

	"github.com/go-martini/martini"
)

var m *martini.Martini

// The regex to check for the requested format (allows an optional trailing
// slash).
//var rxExt = regexp.MustCompile(`(\.(?:xml|text|json))\/?$`)
var rxExt = regexp.MustCompile(`(\.(?:json))\/?$`)

// MapEncoder intercepts the request's URL, detects the requested format,
// and injects the correct encoder dependency for this request. It rewrites
// the URL to remove the format extension, so that routes can be defined
// without it.
func MapEncoder(c martini.Context, w http.ResponseWriter, r *http.Request) {
	// Get the format extension
	matches := rxExt.FindStringSubmatch(r.URL.Path)
	ft := ".json"
	if len(matches) > 1 {
		// Rewrite the URL without the format extension
		l := len(r.URL.Path) - len(matches[1])
		if strings.HasSuffix(r.URL.Path, "/") {
			l--
		}
		r.URL.Path = r.URL.Path[:l]
		ft = matches[1]
	}
	// Inject the requested encoder
	switch ft {
	// case ".xml":
	// 	c.MapTo(xmlEncoder{}, (*Encoder)(nil))
	// 	w.Header().Set("Content-Type", "application/xml")
	// case ".text":
	// 	c.MapTo(textEncoder{}, (*Encoder)(nil))
	// 	w.Header().Set("Content-Type", "text/plain; charset=utf-8")
	default:
		c.MapTo(jsonEncoder{}, (*Encoder)(nil))
		w.Header().Set("Content-Type", "application/json")
	}
}

func main() {
	m = martini.New()

	// Setup middleware
	m.Use(martini.Recovery())
	m.Use(martini.Logger())
	m.Use(MapEncoder)

	// Setup routes
	r := martini.NewRouter()
	r.Get(`/version`, GetVersion)

	// Add the router action
	m.Action(r.Handle)

	http.ListenAndServe(":5000", m)
	m.Run()
}
