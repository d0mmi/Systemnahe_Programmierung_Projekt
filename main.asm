;-------------------------------------------------------
; Cookie Clicker Projekt
;-------------------------------------------------------
CSEG AT 0H
jmp init
ORG 100H

;-------------------------------------------------------
; Init: Initialisiert Register
;-------------------------------------------------------
init:
	mov r0,#00h
	mov r1,#00h
	mov r2,#00h
	mov r3,#00h
	mov 42h, #00h

;-------------------------------------------------------
; Main: Main Loop
;-------------------------------------------------------
main:
	jmp pressed
count:
	cjne r0, #09h, count_0
	cjne r1, #09h, count_1
	cjne r2, #09h, count_2
	cjne r3, #09h, count_3
	jmp win
	resume:
	call zeigen

jmp main

;-------------------------------------------------------
; Button ist gedrückt:
;-------------------------------------------------------
pressed:
	mov A, 42h
	mov 42h, P1
	cjne A, 42h,count
	jmp resume



;-------------------------------------------------------
; Counter: zählt Register hoch
;-------------------------------------------------------
count_0:
	inc r0
	jmp resume

count_1:
	mov r0, #00h
	inc r1
	jmp resume


count_2:
	mov r0, #00h
	mov r1, #00h
	inc r2
	jmp resume

count_3:
	mov r0, #00h
	mov r1, #00h
	mov r2, #00h
	inc r3
	jmp resume


;-------------------------------------------------------
; Win: TODO Add Fancy Display
;-------------------------------------------------------
win:
	mov r0,#00h
	mov r1,#00h
	mov r2,#00h
	mov r3,#00h
	mov 42h, #00h
	jmp main

;-------------------------------------------------------
; Anzeigewerte: holt die Anzeigewerte aus der Datenbank
;-------------------------------------------------------
zeigen:
mov DPTR, #table
;Anzeige 0
mov a, r0
movc a,@a+dptr
mov r4, a
;Anzeige 1
mov a, r1
movc a,@a+dptr
mov r5, a
;Anzeige 2
mov a, r2
movc a,@a+dptr
mov r6, a
;Anzeige 3
mov a, r3
movc a,@a+dptr
mov r7, a
call display
ret

;-----------------------------------------------
;   DISPLAY: steuert die 4x7 Segmentanzeige
;-----------------------------------------------
display:
mov P3, R4
clr P2.0
setb P2.0

mov P3, R5
clr P2.1
setb P2.1

mov P3, R6
clr P2.2
setb P2.2

mov P3, R7
clr P2.3
setb P2.3

ret
;-------------------------------------------------
; TABLE: Datenbank der 7-Segment-Darstellung
;-------------------------------------------------
org 300h
table:
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

end