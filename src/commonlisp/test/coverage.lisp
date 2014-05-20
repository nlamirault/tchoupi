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

(require :sb-cover)
(declaim (optimize sb-cover:store-coverage-data))

(ql:quickload "tchoupi-test")

(lisp-unit:run-tests :all :tchoupi-test)

(let ((output-dir (format nil "/tmp/tchoupi/")))
  (ensure-directories-exist output-dir)
  (sb-cover:report output-dir))

(declaim (optimize (sb-cover:store-coverage-data 0)))
