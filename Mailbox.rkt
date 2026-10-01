; COMP1811 - CW2 Outlook Simulator
; Partner A: <Samira Ozturk>, SID<001464034-1>
; Partner B: <Tahseen Taj>, SID<00149407-4>

; Sample Mailbox (ID From To Date Subject Tag Body Flag Read)
;;Mailbox
(define mb   ;mailbox
 '(;ID From To Date Subject Tag Body Flag Read
   (0  Aniket1@gre.ac.uk    Yasmine8@gre.ac.uk   (11 1 2025) "Aniket s1"  tag0 (("Aniket Yasmine8." "Mail message urgent 1 11_234.")) #f #f)
   (1  Ehsan2@gre.ac.uk     Sanyaade7@gre.ac.uk  (22 2 2025) "Ehsan s1"   tag0 (("Ehsan Sanyaade7." "Message for review 1 22_568."))  #f #t)
   (2  Margarita3@gre.ac.uk Rafael6@gre.ac.uk    (3 3 2025)  "Marg. s1"   tag3 (("Margarita Rafael6." "Please check email 33+234." "Deadline 10/4/2025.")) #t #f)
   (3  Tuan4@gre.ac.uk      Mobolaji5@gre.ac.uk  (4 4 2025)  "Tuan s1"    tag1 (("Tuan Mobolaji5." "Mail body 1 41_234.")) #f #f)
   (4  Mobolaji5@gre.ac.uk  Tuan4@gre.ac.uk      (5 5 2025)  "Mobolajis1" tag3 (("Mobolaji Tuan4.") ()) #f #f)
   (5  Rafael6@gre.ac.uk    Valdimars@gre.ac.uk  (6 6 2025)  "Rafael s1 - urgent response required!"  tag1 (("Rafael Valdimars." "Mail message urgent 1 61_234.") ("Please respond by 10/6/205." "Concerning CW2")) #f #f)
   (6  Sanyaade7@gre.ac.uk  Ehsan2@gre.ac.uk     (7 7 2025)  "Sany. s1"   tag2 (("Sanyaade Ehsan2.")) #t #f)
   (7  Yasmine8@gre.ac.uk   Aniket1@gre.ac.uk    (8 8 2025)  "Yasmines1: response needed by 12/3/2026."  tag2 (("YasmineAniket1.") ("This is a confidential message Re email sent 1/8/2025:" "can you provide the missing documentation." "Your signature is required for doc2 and doc5.") ("Please forward all the documentation by 12/3/26 at the latest." "Doc2 and doc ahouls be password protected.")) #f #t)
   (8  Aniket1@gre.ac.uk    Ehsan2@gre.ac.uk     (11 1 2025) "Anikets2"   tag3 (("Aniket Ehsan2." "SECOND REMINDER") ("re email sent 1/1/2025:" "review request for SI1529873." "Please provide a summary review by 12/1/2025.") ("Reviews should use the RD6 form and sent qr45@gre.ac.uk on completion." "Your comments will be shared with the authors.")) #t #t)
   (9  Aniket1@gre.ac.uk    Margarita3@gre.ac.uk (4 4 2025)  "Aniket s3"  tag1 (("Aniket Margarita3.") ("Mail body 3 41_234.")) #f #f)
   (10 Ehsan2@gre.ac.uk     Moeen9@gre.ac.uk     (4 4 2025)  "Ehsan s2"   tag1 (("Ehsan Moeen9.") ("1st reminder." "Mail body 2 68! 754.") ()) #f #f)
  )
)

; Replace the value at a given position (list index) with the new value in the given email list
; (replace-value 4 "New subject" (get-email 0 mb))
(define (replace-value pos new-val e-lst)
  (cond
    [(null? e-lst) '()]
    [(= pos 0) (cons new-val (cdr e-lst))]
    [else (cons (car e-lst) (replace-value (- pos 1) new-val (cdr e-lst)))] ))

; replaces an enire existing email in the given mailbox
(define (replace-email old new mb-lst)
  (cond [(null? mb-lst) mb-lst]
        [(equal? (car mb-lst) old) (cons new (cdr mb-lst))]
        [else (cons (car mb-lst) (replace-email old new (cdr mb-lst)))] ))