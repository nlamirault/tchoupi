;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;;;
;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          web-test.lisp
;;;; Programmer:    Nicolas Lamirault <nlamirault@gmail.com>
;;;;
;;;; *************************************************************************

(in-package :tchoupi-test)


(defparameter *ut-server* nil)


(define-test can-retrieve-tchoupi-version
  (assert-equal "0.1.0"
		(cdar (http-request (format nil "http://localhost:~A/version"
					    *port*)
			      :get
			      nil))))
