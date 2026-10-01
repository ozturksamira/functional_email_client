; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; FA4 Sort mb-lst by Sender
(define (insert-email e sorted)
    (cond   ; if sorted list is empty, place email here
        [(null? sorted)
            (list e)]

;compare sender of email e with sender of first email. sender is at index 1
    [(symbol<=? (list-ref e 1)
                (list-ref) (car sorted 1))
        (cons e sorted)]

; otherwise keep first email and continue recursively
    [else
        (cons 
            (car sorted)
            (insert-email e (cdr sorted)))]))

;recursively sort mb using insertion sort
(define (sort-by-frm mb-lst)
    (cond
        [(null? mb-lst) '()]

        [else
            (insert-email
                (car mb-lst)
                (sort-by-frm (cdr mb-lst)))]))


; Supporting functions that help encriptions, count sentences in nested bodies. ect
;sentence count
(define (sentence-count body)
  (cond ; has zero sentences
    [(null? body) 0]
    ;add number of sentences in first paragraph then recurse through remaining
    [else
        (+ (length (car body))
           (sentence-count (cdr body)))]))

;get last paragraph
(define (last-paragraph body)
    (if (null? (cdr body))
        (car body)       ; last paragraph reached
        (last-paragraph (cdr body))))

;replace last paragraph with newp
(define (replace-last body newp)
    (cond   ; only when one paragraph remains replace it
        [(null? (cdr body))
            (list newp)]
        ;otherwise keep last paragraph and recurse
        [else
            (cons (car body)
                (replace-last (cdr body) newp))]))