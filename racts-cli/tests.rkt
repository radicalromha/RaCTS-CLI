#lang racket

(require recktunit
         "task.rkt")

(define (dummy-task)
  (sleep 1)
  (printf "Task excuted.\n"))

(define test-task-id (submit-task dummy-task '() 1))

(check-equal? (get-task-status test-task-id) 'pending)

