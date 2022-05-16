include "emu8086.inc"
.model small 
.stack 100h
.data
;a equ 10000b
;len equ 8
 .code 
 main proc   
    mov ax,@data
    mov ds,ax      
     
    mov al,10101000b
    mov dx,0
    mov cx,8  
 
    count:  
        rcr al,1
        jc incr 
        jmp skip
        incr:
            inc dx 
        skip:
    loop count    
        
    
    
    
 endp main
 end main
