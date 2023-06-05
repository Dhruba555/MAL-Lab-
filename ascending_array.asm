include 'emu8086.inc'
.model small
.stack 100h

.data      
     arr db 5 dup(?) 
.code
    main proc         
        mov ax, @data
        mov ds,ax
        
        print "Enter 5 number in array: "
        
        mov cx,5
        mov bx,offset arr
        mov ah,01
         
        
        input:
        int 21h
        mov [bx],al
        inc bx 
        loop input
        
        mov cx, 5
        dec cx
        
        outerloop:
        mov bx,cx
        mov si,0
        
        comploop:
        mov al,arr[si]
        mov dl,arr[si+1]
        cmp al,dl
        
        jc noSwap
        
        mov arr[si],dl
        mov arr[si+1],al
        
        noSwap:
        inc si
        dec bx
        jnz comploop
        
        loop outerloop
        
        mov ah,02
        mov dl,10
        int 21h
        
        mov dl,13
        int 21h
        
        print "After Sorting Array: "
        
        mov cx,5
        mov bx,offset arr
        
        outputs:
        mov dl,[bx]
        mov ah,02
        int 21h
        
        mov dl,32
        mov ah,02h
        int 21h                
                
        inc bx
        loop outputs
        
    
    
    main endp
    
end main