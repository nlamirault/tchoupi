#lang racket/base

(require rackunit
	 "../tchoupi.rkt")


(check-equal? "0.1.0" (get-version) "Retrieve Tchoupi version")
