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
	"log"
	"net/http"

	"github.com/go-martini/martini"
	"github.com/martini-contrib/encoder"
)

func Server() *martini.Martini {
	m := martini.New()
	route := martini.NewRouter()
	// map json encoder
	m.Use(func(c martini.Context, w http.ResponseWriter) {
		c.MapTo(encoder.JsonEncoder{}, (*encoder.Encoder)(nil))
		w.Header().Set("Content-Type", "application/json; charset=utf-8")
	})

	route.Get(`/version`, GetVersion)
	m.Action(route.Handle)

	return m
}

func main() {
	server := Server()
	log.Println("Waiting for connections...")
	if err := http.ListenAndServe(":5000", server); err != nil {
		log.Fatal(err)
	}
}
