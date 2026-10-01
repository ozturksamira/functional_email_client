; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; FA1 Retrieve Email by ID
(define (get-email id mb-lst)
    (cond   ; if mb is empty return empty list
        [(null? mb-lst) '()]
        ; checks if current email ID matches requested ID
        [(= id (list-ref (car mb-lst) 0))
            (car mb-lst)]      ; match found
        ; otherwise continue searching mb
        [else
            (get-email id (cdr mb-lst))]))     ;recursive search