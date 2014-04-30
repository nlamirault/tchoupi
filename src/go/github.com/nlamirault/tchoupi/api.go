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
	//"fmt"
	"log"
	"net/http"
)

// Return the API version
func GetVersion(r *http.Request, enc Encoder) (int, string) {
	log.Printf("[GET] API Version")
	api_version := &Version{TchoupiVersion}
	return http.StatusOK, Must(enc.Encode(api_version))
}
