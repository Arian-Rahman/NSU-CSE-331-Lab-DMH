include "emu8086.inc"
.model small
.stack 100h
.data    
    
    a1  dw 20  dup (?)
    a2  dw 20  dup (?)
    sum  dw 20 dup (0) 
    len1 dw 0
    len2 dw 0 

.code                 
proc main

    mov ax,@data
    mov ds,ax
    
    printn "Enter First array size : "
    CALL scan_num
      
    ;CX is already loaded
    mov len1,cx 
     
    lea si,a1 
    
    printn " "
    printn "Enter values for first array : "
    
     
    inp:
        push cx   
        ;mov ah,01h
;        int 21h
;        mov [si],al  ;check if it's right 
        call scan_num
        mov [si],cx

        inc si
        inc si  
        pop cx
    loop inp 
     
     
     printn "Enter second array size : "
     CALL scan_num
      
    ;cx is already loaded  
    mov len2,cx
      
     lea si,a2 
     
     printn "Enter second array values : "
     
     inp2:    
        push cx
        
        call scan_num
        mov [si],cx
         
        inc si
        inc si 
        pop cx
    loop inp2 
                  
   
        
    lea si,a1
    lea di,sum    
     
    mov cx,len1
    sum1:     
        mov ax,[si]
        add [di],ax
        inc si
        inc si
        inc di
        inc di
        
    loop sum1 
    
    
    lea si,a2
    lea di,sum    
     
    mov cx,len2 
    sum2:     
        mov ax,[si]
        add [di],ax
        inc si
        inc si
        inc di
        inc di
        
    loop sum2


define_scan_num

endp main 
end main