include 'emu8086.inc'
.model small
.stack 100h

.data
    count equ 20
    asterisk db '*'

.code
    main proc
        mov ax, @data
        mov ds, ax

        mov cx, count           ; Set the loop counter to 20

    print_loop:
        mov dl, asterisk        ; Move the asterisk character to DL
        mov ah, 02h             ; Function to print character
        int 21h               

        dec cx                  ; Decrement the loop counter
        jnz print_loop          ; Jump to print_loop if the counter is not zero

        mov ah, 4Ch             ; Exit program
        int 21h
    main endp

end main
