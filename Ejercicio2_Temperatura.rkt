#lang racket


(define (clasificar-temperatura t)
  (cond
    [(< t 15) "Temperatura mínima (fría)"]
    [(and (>= t 15) (<= t 25)) "Temperatura ambiente"]
    [else "Temperatura alta (caliente)"]))


(define (c->f c)
  (+ (* 9/5 c) 32))

(define (c->k c)
  (+ c 273.15))


(define temperaturas
  '( -5 0 10 14.9 15 20 25 26 30 40))

(define (mostrar-temperatura c)
  (define f (c->f c))
  (define k (c->k c))
  (printf "C: ~a °C\tF: ~a °F\tK: ~a K\t=> ~a\n"
          c f k (clasificar-temperatura c)))

(define (main)
  (displayln " Clasificador de temperatura")
  (displayln "Rangos:")
  (displayln "  < 15°C  → mínima")
  (displayln "  15–25°C → ambiente")
  (displayln "  > 25°C  → alta")
  (newline)
  (displayln "Temperaturas de ejemplo:")
  (for-each mostrar-temperatura temperaturas))

(main)