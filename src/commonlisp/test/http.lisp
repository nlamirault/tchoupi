;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;;;
;;;; *************************************************************************
;;;; FILE IDENTIFICATION
;;;;
;;;; Name:          http.lisp
;;;; Programmer:    Nicolas Lamirault <nlamirault@gmail.com>
;;;;
;;;; *************************************************************************


(in-package #:tchoupi-test)


(define-condition tchoupi-request-error (simple-error)
  ((code :reader code
         :initarg :code
         :documentation "The error code.")
   (message :reader message
            :initarg :message
            :documentation "Explanation message."))
  (:documentation "Tchoupi request error.")
  (:report (lambda (condition stream)
             (format stream "Tchoupi error ~A : ~A."
                     (code condition) (message condition)))))


(defun http-request (url method parameters)
  "Perform HTTP request."
  (progn
    (format t "~&Tchoupi Call : ~A ~%Params: ~A~%" url parameters)
    (multiple-value-bind (body status-code headers uri stream must-close)
	(if (equal :post method)
	    (drakma:http-request url
				 :method method
				 :content-length t
				 :parameters parameters)
	    (drakma:http-request url
				 :method method
				 :parameters parameters))
      (format t "~&Tchoupi Call HTTP ~A~&Response: ~A." status-code body)
      ;;(declare (ignore headers uri stream must-close))
      (if (and status-code (< status-code 400))
	  (json:decode-json-from-string body)
	  (error 'tchoupi-request-error :code status-code :message body)))))
