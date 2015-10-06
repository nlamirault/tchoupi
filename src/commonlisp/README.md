# Tchoupi Common Lisp

* Install [SBCL](http://www.sbcl.org):

* Install [quicklisp](https://www.quicklisp.org/)

* Start a Common Lisp REPL :

         CL-USER> (push "you/directory/tchoupi/src/commonlisp/" asdf:*central-registry*)
         CL-USER> (ql:quickload "tchoupi")
         [...]
         CL-USER> (tchoupi:start-server)
         To load "clack-handler-hunchentoot":
         Load 1 ASDF system:
         clack-handler-hunchentoot
         ; Loading "clack-handler-hunchentoot"
         [package clack.handler.hunchentoot]
         Hunchentoot server is started.
         Listening on localhost:5000.
         #<CLACK.HANDLER:<HANDLER> {1009320BE3}>

* Check website

        $ curl http://localhost:5000/version
        {"version": "1"}
