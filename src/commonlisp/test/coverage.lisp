;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          cover.lisp
;;;; Purpose:       tchoupi code coverage.
;;;; Programmer:    Nicolas Lamirault <nlamirault@gmail.com>
;;;;
;;;; *************************************************************************


(require :sb-cover)
(declaim (optimize sb-cover:store-coverage-data))

(ql:quickload "tchoupi-test")

(lisp-unit:run-tests :all :tchoupi-test)

(let ((output-dir (format nil "/tmp/tchoupi/")))
  (ensure-directories-exist output-dir)
  (sb-cover:report output-dir))

(declaim (optimize (sb-cover:store-coverage-data 0)))
