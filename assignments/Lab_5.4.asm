
include "emu8086.inc"
.model small
.stack 100h
.data    
 ar db 10,1,2,2,3,3,3,4,4,4,5,5,5,5,5,6,6,6,6,6
 len equ $ - ar
 arr db 11 dp (0)  

.code 
 main proc  
             
    mov ax,@data   
    mov ds,ax   
          
    lea di,arr     ; arr moves  with cx
    add di,10      ;since loop works from 10 to 0 
    
    mov cx,10
    outer:                  ;runs 10 times  
          lea si,ar         ;load ar
          mov bx,0          ;load counter for ar
          comp:
            cmp bx,20       ;ar will need to be looked 20 times
            je out_of_comp 
            
            mov ax,0
            mov al,[si]
            cmp cx,ax     ;compare ar's value to cx   
                     
            jne skip_inner  ;if no match skip counter increment part
                inner:      ; counter incremnt loop
                   
                   mov al,[di] ;load current arr value  
                   inc al
                   mov [di],ax ; arr value is incremented based on index
         
             skip_inner:    
            inc si
            inc bx 
           
           jmp comp  
           
         out_of_comp:  
          dec di  
    loop outer
 
    
                 
 endp main
 end main