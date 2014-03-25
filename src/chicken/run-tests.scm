;;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;;

(use posix srfi-78)

(check-reset!)

(let load-tests ((test-files (directory "test")))
  (cond
   ((null? test-files)
    'all-tests-done)
   ((string-suffix? ".scm" (car test-files))
    (load (conc "test/" (car test-files)))
    (load-tests (cdr test-files)))
   (else
    (load-tests (cdr test-files)))))

(check-report)
