; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; FA2 Delete Email (move to "bin")
(define (move-to-bin email)]
    (list
        (list-ref email 0) ; ID
        (list-ref email 1) ; From
        (list-ref email 2) ; To
        (list-ref email 3) ; Date
        (list-ref email 4) ; Subject
        'bin               ; Tag replaced
        (list-ref email 6) ; Body
        (list-ref email 7) ; Flag
        (list-ref email 8))) ; Read

(define(del-email id mb-lst)
    (cond   ; empty mb
        [(null? mb-lst) '()]
        ; if ID matches, update email
        [(=id (list-ref (car mb-lst)))
            (cons
                (replace-value 5 'bin (car mb-lst))
                    (del-email id (cdr mb-lst)))]
    ;otherwise keep unchanged
    [else
        (cons (car mb-lst)
              (del-email id (cdr mb-lst)))]))