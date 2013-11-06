;;;; tchoupi.asd
;;;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

(asdf:defsystem #:tchoupi
  :serial t
  :description "Tchoupi REST webservice"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :license "GPL-2"
  :depends-on (#:hunchentoot)
  :components ((:module :src
			:components ((:file "package")
				     (:file "tchoupi" :depends-on ("package"))))))
