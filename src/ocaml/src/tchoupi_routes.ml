(* Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com> *)

(* Licensed under the Apache License, Version 2.0 (the "License"); *)
(* you may not use this file except in compliance with the License. *)
(* You may obtain a copy of the License at *)

(*     http://www.apache.org/licenses/LICENSE-2.0 *)

(* Unless required by applicable law or agreed to in writing, software *)
(* distributed under the License is distributed on an "AS IS" BASIS, *)
(* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. *)
(* See the License for the specific language governing permissions and *)
(* limitations under the License. *)

open Printf

open Opium.Std

open Tchoupi_version


type version_json = {
  name: string;
}


let json_of_version { name  } =
  let open Ezjsonm in
  dict [ "name", (string name) ]


let route_version =
  get "/version"
      begin fun req ->
      let resp = { name = Tchoupi_version.version; } in
      `Json (resp |> json_of_version |> Ezjsonm.wrap) |> respond'
      end


let route_help =
  get "/" (fun req -> `String "Welcome to Tchoupi" |> respond')
