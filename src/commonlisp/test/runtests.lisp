;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          runtests.lisp
;;;; Purpose:       tchoupi unit tests.
;;;; Programmer:    Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;;
;;;; *************************************************************************


;; Edit this variable
(defparameter *quicklisp-homedir*
  (merge-pathnames "Apps/quicklisp/" (user-homedir-pathname)))

(load (merge-pathnames *quicklisp-homedir* "/setup.lisp"))

(ql:quickload "tchoupi")
(ql:quickload "tchoupi-test")
(setq lisp-unit:*print-failures* t)
(setq lisp-unit:*print-errors* t)
(setq lisp-unit:*print-summary* t)
(lisp-unit:run-tests :all :tchoupi-test)
