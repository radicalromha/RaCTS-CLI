FROM racket/racket-ci:alpine
COPY . /racts-cli
WORKDIR /racts-cli
CMD racket tasks.rkt