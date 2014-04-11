;;
;; Continuous integration: launch unit tests
;;

(in-package :cl-user)

(load ".clenv/.quicklisp/setup.lisp")

(ql:quickload "tchoupi")
(ql:quickload "tchoupi-test")

(setq lisp-unit:*print-failures* t)
(setq lisp-unit:*print-errors* t)
(setq lisp-unit:*print-summary* t)

(tchoupi:start-server)
(lisp-unit:run-tests :all :tchoupi-test)
(tchoupi:stop-server)
