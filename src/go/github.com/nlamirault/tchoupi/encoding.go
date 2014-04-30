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
	//	"bytes"
	"encoding/json"
	"log"
	//	"encoding/xml"
	//	"fmt"
)

// An Encoder implements an encoding format of values to be sent as response to
// requests on the API endpoints.
type Encoder interface {
	Encode(v ...interface{}) (string, error)
}

// Because `panic`s are caught by martini's Recovery handler, it can be used
// to return server-side errors (500). Some helpful text message should probably
// be sent, although not the technical error (which is printed in the log).
func Must(data string, err error) string {
	if err != nil {
		panic(err)
	}
	log.Printf("Data: %s", data)
	return data
}

type jsonEncoder struct{}

// jsonEncoder is an Encoder that produces JSON-formatted responses.
func (_ jsonEncoder) Encode(v ...interface{}) (string, error) {
	log.Printf("Encode: %s", v)
	var data interface{} = v
	if v == nil {
		// So that empty results produces `[]` and not `null`
		data = []interface{}{}
	} else if len(v) == 1 {
		data = v[0]
	}
	log.Printf("JSON before: %s", data)
	b, err := json.Marshal(data)
	log.Printf("JSON: %s", b)
	return string(b), err
}

// type xmlEncoder struct{}

// // xmlEncoder is an Encoder that produces XML-formatted responses.
// func (_ xmlEncoder) Encode(v ...interface{}) (string, error) {
// 	var buf bytes.Buffer
// 	if _, err := buf.Write([]byte(xml.Header)); err != nil {
// 		return "", err
// 	}
// 	if _, err := buf.Write([]byte("<albums>")); err != nil {
// 		return "", err
// 	}
// 	b, err := xml.Marshal(v)
// 	if err != nil {
// 		return "", err
// 	}
// 	if _, err := buf.Write(b); err != nil {
// 		return "", err
// 	}
// 	if _, err := buf.Write([]byte("</albums>")); err != nil {
// 		return "", err
// 	}
// 	return buf.String(), nil
// }

// type textEncoder struct{}

// // textEncoder is an Encoder that produces plain text-formatted responses.
// func (_ textEncoder) Encode(v ...interface{}) (string, error) {
// 	var buf bytes.Buffer
// 	for _, v := range v {
// 		if _, err := fmt.Fprintf(&buf, "%s\n", v); err != nil {
// 			return "", err
// 		}
// 	}
// 	return buf.String(), nil
// }
