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

#[macro_use]
extern crate log;
extern crate env_logger;
extern crate iron;
extern crate router;
extern crate rustc_serialize;

// use iron::prelude::*;
// use iron::status;

mod tchoupi;

use tchoupi::routes;

fn main() {
    env_logger::init().unwrap();
    info!("Starting");
    iron::Iron::new(routes::routes()).http("localhost:8080").unwrap();
}
