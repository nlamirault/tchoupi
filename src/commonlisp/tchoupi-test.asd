;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(in-package :cl-user)
(defpackage tchoupi-test-asd
  (:use :cl :asdf))
(in-package :tchoupi-test-asd)

(defsystem tchoupi-test
  :defsystem-depends-on (:prove-asdf)
  :depends-on (:tchoupi
               :drakma
               :cl-json
               :prove)
  :components ((:module "t"
                :components
                ((:file "package")
                 (:file "http" :depends-on ("package"))
                 (:test-file "web-test" :depends-on ("http")))))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove) c)
                    (asdf:clear-system c)))
