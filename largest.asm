include 'emu8086.inc'
.model samll
.stack 100h

.data 
    array db 6,9,3,4,7
    
.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov si, offset array
        mov cx, 5
        mov bl,[si]
        
        loopx:
            cmp [si], bl
            jge update
            resume:
            inc si
            loop loopx
            
            print 'Largest value from array: '
            add bl,48
            mov dl,bl
            mov ah,02h
            int 21h
            
            update:
                mov bl,[si]
                jmp resume    
        
        
    main endp
end main