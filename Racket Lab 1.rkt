#lang racket

;;; Question 1

;;; 1.a. = 18
;;; 1.b. = #f 
;;; 1.c. = 'elmer 
;;; 1.d. = '(fudd daffy duck)
;;; 1.e. = #f

;;; Question 2

;;; 2.a.

(define y '(clam squid octopus))
(car (cdr y))

;;; 2.b.

(define z '(clam starfish (squid octopus) mollusc))
(car (car (cdr (cdr z))))

;;; Question 3

(define (avg a b)
  (/ (+ a b) 2))

;;; Question 4

(define (mymax a b)
  (if (> a b)
      a
      b))

;;; Question 5
;;; Can't be answered in the text file.

;;; Question 6

(define (sum lst)
  (if (eq? lst '())
      0
      (+
       (car lst)
       (sum (cdr lst))
       )
      )
  )

;;; Question 7

(define (sumAux lst)
  (if (eq? (cdr lst) '())
      (car lst)
      (sumAux
       (append
        (list
         (+
          (car lst)
          (car (cdr lst))
          )
         )
        (cdr (cdr lst))
        )
       )
      )
  )

;;; Question 8

;;; 8.a. = 106
;;; 8.b. = 6

;;; Question 9

(define (mylength lst)
  (if (eq? lst '())
      0
      (+
       1
       (mylength (cdr lst))
       )
      )
  )