;;;; tchoupi.asd
;;;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

(asdf:defsystem #:tchoupi-test
  :serial t
  :description "Tchoupi unit tests"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :license "GPL-2"
  :depends-on (#:tchoupi
	       #:drakma
	        #:cl-json
	       #:lisp-unit)
  :components
  ((:module :test
	    :components ((:file "package")
			 (:file "http" :depends-on ("package"))
			 (:file "web-test" :depends-on ("http"))))))
