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

(asdf:defsystem #:tchoupi-test
  :serial t
  :description "Tchoupi unit tests"
  :author "Nicolas Lamirault <nicolas.lamirault@gmail.com>"
  :license "GPL-2"
  :depends-on (#:tchoupi
	       #:drakma
	        #:cl-json
	       #:lisp-unit)
  :components
  ((:module :test
	    :components ((:file "package")
			 (:file "http" :depends-on ("package"))
			 (:file "web-test" :depends-on ("http"))))))
