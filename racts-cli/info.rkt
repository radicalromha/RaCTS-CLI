#lang info
(define collection "racts-cli")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/racts-cli.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(Eskinder Fitsum))
(define license '(Apache-2.0 OR MIT))

#lang setup/infotab

(define name "racts-cli")
(define version "0.1.0")
(define deps '("racket" "argparse" "rackunit"))
(define build-deps '("scribble-lib"))
(define scribblings '(("scribblings/racts.scrbl" (multi-page))))