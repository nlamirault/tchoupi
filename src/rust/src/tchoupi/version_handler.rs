// Copyright (C) 2015, 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

// use iron::prelude::*;
// use iron::status;
// use router::Router;

use rustc_serialize::json;
use iron::status;
use iron::IronResult;
use iron::Request;
use iron::Response;

#[derive(RustcDecodable, RustcEncodable, Debug)]
struct Version {
    version: String,
}


pub fn get_version(_: &mut Request) -> IronResult<Response> {
    info!("Get API version");
    let version = Version { version: "1".to_string() };
    let payload = json::encode(&version).unwrap();
    Ok(Response::with((status::Ok, payload)))
}
