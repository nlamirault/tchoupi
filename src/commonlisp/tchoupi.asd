;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(in-package :cl-user)
(defpackage tchoupi-asd
  (:use :cl :asdf))
(in-package :tchoupi-asd)

(defsystem tchoupi
  :version "0.5.0"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :license "GPL-2"
  :depends-on (:hunchentoot :clack :ningle)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "tchoupi" :depends-on ("package")))))
  :description "Tchoupi webservice."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op tchoupi-test))))
