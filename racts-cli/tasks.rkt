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

;;function to submit a task
(define (submit-task func args priority)
  (let ([task-id (semaphore-wait task-id-counter)])
    (set! task-id (add1 task-id))
    (define new-task (task task-id func args priority 'pending))
    (queue-add! task-queue new-task)
    (semaphore-post task-id-counter)
    (schedule-tasks)
    task-id))

;;function to get task status
(define (get-task-status task-id)
  (let loop ([queue task-queue])
    (if (queue-empty? queue)
        'not-found
        (let ([task (queue-peek queue)])
          (if (= (task-id task) task-id)
              (task-status task)
              (loop (queue-tail queue)))))))

;;function to configure scheduler
(define (configure-scheduler new-thread-pool-size)
  (set! thread-pool-size new-thread-pool-size)
  (schedule-tasks))