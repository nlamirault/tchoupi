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
