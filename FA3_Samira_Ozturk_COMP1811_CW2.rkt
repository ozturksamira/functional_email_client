; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; FA3 Filter mb-lst by Sender
(define (filter-frm frm mb-lst)
    (cond   ;empty mb
        [(null? mb-lst '()]
        ; if sender matched add email to result
        [(equal? frm (list-ref (car mb-lst) 1))]
            (cons
                (car mb-lst)
                (filter-frm frm (cdr mb-lst)))]
        ; otherwise skip this email
        [else
        (filter-frm frm (cdr mb-lst))]))