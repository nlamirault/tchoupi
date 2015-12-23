;; Copyright (C) 2014, 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

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
    (declare (ignore headers uri stream must-close))
    (format t "~&Tchoupi Call HTTP ~A~&Response: ~A." status-code body)
    (if (and status-code (< status-code 400))
        (json:decode-json-from-string body)
        (error 'tchoupi-request-error :code status-code :message body))))
