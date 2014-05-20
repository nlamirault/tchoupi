;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
