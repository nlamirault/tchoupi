#lang racket

(require (planet dmac/spin))

;; (get "/version"
;;      (lambda () "{\"version\": \"0.1.0\"}"))

(define (json-response-maker status headers body)
  (response status
            (status->message status)
            (current-seconds)
            #"application/json; charset=utf-8"
            headers
            (let ([jsexpr-body (string->jsexpr body)])
              (lambda (op) (write-json (force jsexpr-body) op)))))

(define (json-get path handler)
  (define-handler "GET" path handler json-response-maker))


(json-get "/version"
	  (lambda (req)
	    "{\"version\":\"0.1.0\"}"))

(run)
