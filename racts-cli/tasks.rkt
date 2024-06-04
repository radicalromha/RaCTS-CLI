#lang racket

(provide submot-task get-task-status configure-scheduler)

(require racket/thread
         racket/queue
         racket/synchronization)

;;task structure
(struct task (id func args priority status) #:mutable)
