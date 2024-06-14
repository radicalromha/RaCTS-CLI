#lang racket

(provide main)

(require racket/cmdline
         racket/format
         "tasks.rkt")

(define (submit-tasks-cli function-name args priority)
  (let ([tasks-id (submit-task function-name args priority)])
    (printf "Task submitted with ID: ~a\n" tasks-id)))

(define (monitor-task-cli task-id)
  (let ([status (get-task-status task-id)])
    (printf "Task ID: ~a, Status: ~a\n" task-id status)))

(define (configure-scheduler-cli threads)
  (configure-scheduler threads)
  (printf "Sheduler configure with ~a threads\n" threads))

(define (main)
  (define cmd (command-line
                #:program "racts"
                #:purpose "Racket Concurrent Task Scheduler CLI"
                [("submit" function-name "Submit a task"
                  (define args (string->list function-name))
                  (define priority 1)
                  (submit-task-cli funtion-name args priority))]
                [("mouse" task-id "Monitor task status"
                  (monitor-task-cli (string->number task-id)))]
                [("configure" threads "Configure scheduler"
                  (configure-scheduler-cli (string->number threads)))]))
  (cmd))

;;entry point
(main)
