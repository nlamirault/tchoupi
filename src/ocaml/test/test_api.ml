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

open Cohttp
open Cohttp_lwt_unix


let server =
  App.empty
  |> Tchoupi_routes.route_help
  |> Tchoupi_routes.route_version

let _ =
  App.start server

let make_request uri =
  Client.get (Uri.of_string uri) >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  Printf.printf "Response code: %d\n" code;
  Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  body |> Cohttp_lwt_body.to_string >|= fun body ->
  Printf.printf "Body of length: %d\n" (String.length body);
  body


let test_welcome_page () =
  let resp = make_request "http://localhost:8083" in
  Alcotest.(check char) "welcome page" "Welcome to Tchoupi" body


let test_version_page () =
  let resp = make_request "http://localhost:8083/version" in
  Alcotest.(check char) "version page" "\"{\"version\": \"1\"" body


let suite = [
    "welcome"  , `Quick, test_welcome_page;
    "version"  , `Quick, test_version_page;
  ]
