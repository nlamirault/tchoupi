;;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;


(use srfi-78)


(define raw-version
  (conc "{\"version\": \"0.1.0\"}"))

(define unsanitised-version
  `#(("version" . "0.1.0")))

(check (with-input-from-string raw-version json-read) => unsanitised-version)
