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

(in-package #:tchoupi)


(defparameter *handler* nil
  "The Tchoupi web server.")

(defparameter *port* 8082
  "Default port for the webservice.")


(defun install-routes (app)
  (setf (ningle:route app "/")
        "Welcome to Tchoupi!")
  (setf (ningle:route app "/version" :method :GET)
        "{\"version\": \"1\"}")
  )

(defun start-server ()
  (let ((app (make-instance 'ningle:<app>)))
    (install-routes app)
    (setf *handler*
          (clack:clackup app
                         ;;:server :hunchentoot
                         :port *port*))))

(defun stop-server ()
  (clack:stop *handler*)
  (setf *handler* nil))
