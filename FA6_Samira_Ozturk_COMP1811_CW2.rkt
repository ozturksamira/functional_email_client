; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>
; FA6 Add New Email

(define (add-email frm to date subject tag body mb-lst)

  (let* (                       ; allows sequential bindings where later variables can use earlier defined valyes
          (id (next-id mb-lst)) ; next unique id based on mb content

          (final-body
            (if (eq? tag 'conf)
                (encrypt body)
                body))
          ; if tag is confidential, tag must be encrypted

         (new-email
            (list id
                frm
                to
                date
                subject
                tag
                final-body
                #f          ; read flag initially false
                #f))        ; bin flag initially false
         )

    (append mb-lst (list new-email))))


; testing
(get-email 1 mb)
(del-email 1 mb)
(filter-frm 'Ehsan2@gre.ac.uk mb)
(sort-by-frm mb)
(encrypt '(("Body new" "L2.") ("Conf 1811.A") ("P3" "L2" "L3" "L4")))
(add-email 'Kim9@gre.ac.uk 'Zia10@gre.ac.uk '(10 2 2026) "Reminder 1!" 'inbox '(("Body msg new.")("Sam." "Zia." "Confirmed meeting")("Teams link to follow")) mb)