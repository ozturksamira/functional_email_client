; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; FA5 Encrypt Body Message
(define (encrypt body)

    (let* ((p (length body))            ; number of paragraphs in email body
           (s (sentence-count body))    ; total number of sentences
           (e (if (null? body)          ; number of sentences in first paragraph
                'SCRT                   ; if empty, return SCRT
                (length (car body))))

           ;paragraph x sentences, part of secret encryption code
           (code1 (* p s))
           ;sentence count x 100, else if empty use SCRT
           (code2 (if (symbol? e) 'SCRT (* e 100)))

           ; combine both values in struuctured secret message
           (secret (list 'Secret-code (list code1 code2))))

    ; if the body is empty, create new secret code
    (if (null? body)
        (list (list secret))
        ;otherwise append secret code to last paragraph
        (let* (
                (lp (last-paragraph body))
                (newp (append lp (list secret))))
          (replace-last body newp)))))


; Supporting function to help the code compute next to email ID
;find max id
(define (max-id mb-lst)

;if only one email remains return its ID
    (cond
        [(null? (cdr mb-lst))
        (list-ref (car mb-lst))]

    [else
        (max
            (list-ref (car mb-lst))
            (max-id (cdr mb-lst)))]))

;generate next id, if mb is empty start at 0 othwewise return +1
(define (next-id mb-lst)

  (if (null? mb-lst)
      0
      (+ 1 (max-id mb-lst))))



