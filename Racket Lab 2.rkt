#lang racket

(require racket/struct)

;;; Question 1

; For lists of differing lengths I have stopped calculating at the shortest length.
; This is because there are functions which would not make sense to return a result.
; + would be fine but divide would be problematic.
; Since any function can be taken it is best to limit potential problems.

(define (map2 fnc lst1 lst2)
  (if (or (eq? lst1 '()) (eq? lst2 '()))
      (append
       '()
       )
      (cons
       (fnc
        (car lst1)
        (car lst2)
        )
       (map2
        fnc
        (cdr lst1)
        (cdr lst2)
        )
       )
      )
  )

;;; Question 2

; The answer is 5.
; 2 is bound to x and entered into the lamda.
; f is evaluated within the environment of x as 17.
; But f has already been assigned an x by that point.

(let ((x 2))
  (let ((f (lambda (n) (+ x n))))
  (let ((x 17))
    (f 3))))

;;; Question 3

; The answer is 103.
; This is because the 3 is assigned to addit separately from the m.

(define (addN n)
  (lambda (m) (+ m n)))

(let* ((m 10)
       (n 20)
       (addit (addN 3)))
  (addit 100))


;;; Question 4

; This evaluates to 14.
; The lambda f is defined but has no effect whereas the x is defined and calculated.

(let ((f (lambda () (/ 1 0)))
      (x (+ 3 4)))
  (+ x x))


;;; Question 5

(struct point3d (x y z)
  #:mutable
  #:methods gen:custom-write
  [(define write-proc
     (make-constructor-style-printer
      (lambda (obj) 'point3d)
      (lambda (obj) (list (point3d-x obj) (point3d-y obj) (point3d-z obj)))))])

(define p
  (point3d 0 0 0))

(set-point3d-z! p 10)
(print p)

;;; Question 6

(define (make-cell)
  (let ((value null))
      
    (define (get-value)
      value)
      
    (define (set-value! amount)
      (set! value amount))

    (define (dispatch m)
      (cond ((eq? m 'get-value) get-value)
            ((eq? m 'set-value!) set-value!)
            (else (error "Unknown request -- MAKE-CELL" m))))

    dispatch
    )
  )


;;; Question 7

(define (make-point)
  (let ((x 0) (y 0))

    (define (get-x)
      x)

    (define (get-y)
      y)

    (define (set-x! amount)
      (set! x amount))

    (define (set-y! amount)
      (set! y amount))

    (define (print-point)
      (print (list 'point (get-x) (get-y))))

    (define (dispatch m)
      (cond ((eq? m 'get-x) get-x)
            ((eq? m 'get-y) get-y)
            ((eq? m 'set-x!) set-x!)
            ((eq? m 'set-y!) set-y!)
            ((eq? m 'print-point) print-point)
            (else (error "Unknown request - MAKE-POINT" m))))

    dispatch)
  )