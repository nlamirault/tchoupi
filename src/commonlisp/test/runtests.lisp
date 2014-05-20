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

(in-package :cl-user)

(let ((quicklisp-file
       (make-pathname :directory (pathname-directory (user-homedir-pathname))
		      :name "quicklisp/setup" :type "lisp")))
  (format t "Quiclisp: ~s" quicklisp-file)
  (load quicklisp-file))

(ql:quickload "tchoupi")
(ql:quickload "tchoupi-test")

(setq lisp-unit:*print-failures* t)
(setq lisp-unit:*print-errors* t)
(setq lisp-unit:*print-summary* t)

(tchoupi:start-server)
(lisp-unit:run-tests :all :tchoupi-test)
(tchoupi:stop-server)
