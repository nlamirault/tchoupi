(*
 * Copyright (c) 2013 Nicolas Lamirault <nicolas.lamirault@gmail.com>
 *
 *)

open Printf
open Lwt

open Cohttp
open Cohttp_lwt_unix

let make_server () =
  let callback conn_id ?body req =
    match Uri.path (Request.uri req) with
    |""|"/" -> Server.respond_string ~status:`OK ~body:"helloworld" ()
    |"/post" -> begin
       lwt body = Cohttp_lwt_body.string_of_body body in
       Server.respond_string ~status:`OK ~body ()
    end
    |"/postnodrain" -> begin
       Server.respond_string ~status:`OK ~body:"nodrain" ()
    end
    |_ ->
       let fname = Server.resolve_file ~docroot:"." ~uri:(Request.uri req) in
       Server.respond_file ~fname ()
  in
  let conn_closed conn_id () =
    Printf.eprintf "conn %s closed\n%!" (Server.string_of_conn_id conn_id)
  in
  let config = { Server.callback; conn_closed } in
  Server.create ~address:"0.0.0.0" ~port:5000 config

let _ = Lwt_unix.run (make_server ())

let () = print_endline "Hello world!"
