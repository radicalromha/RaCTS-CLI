#lang racket

(provide submot-task get-task-status configure-scheduler)

(require racket/thread
         racket/queue
         racket/synchronization)

;;task structure
(struct task (id func args priority status) #:mutable)

;;task queue
(define task-queue (make-queue))

;;task-id counter using semaphores
(define task-id-counter (make-semaphore 1 0))

;;thread pool size
(define thread-pool-size 4)

;;worker threads
(define worker-threads '())