;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;;;
;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          tchoupi.lisp
;;;; Programmer:    Nicolas Lamirault <nlamirault@gmail.com>
;;;;
;;;; *************************************************************************


(in-package #:tchoupi)


(defvar *port* 8085)

(defvar *server* nil)

(defparameter *version* "0.1.0")


;; API


(defun start-server ()
  "Start the web service."
  (format t "** Starting hunchentoot @ :~A~%"  *port*)
  ;; (setq *server*
  ;; 	(hunchentoot:start
  ;; 	 (make-instance 'hunchentoot:easy-acceptor
  ;; 			:port *port*))))
  (setq *server*
	(make-instance 'hunchentoot:easy-acceptor :port *port*))
  (hunchentoot:start *server*))

(defun stop-server ()
  "Stop the web service."
  (hunchentoot:stop *server*))


;; REST


(define-easy-handler (front-page :uri "/version") ()
  (format nil "{\"version\": \"~A\"}" *version*))
