#lang racket/base

(require web-server/servlet
	 web-server/servlet-env)


;; Implementation

(define (get-version)
  "0.1.0")


(define (start request)
  (response/xexpr "Version"))

;;(serve/servlet start #:port 8085 #:servlet-path "/")
