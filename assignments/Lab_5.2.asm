
include "emu8086.inc"
.model small
.stack 100h
.data    
 x dw ?
 y dw ? 
 mul_1 dw ?  
 mul_2 dw ? 

.code 
 main proc  
    
    ;please use single digit integers as input 
    ;press enter after entering number  
         
             
    mov ax,@data   
    mov ds,ax 
     
     
    ;scan x  
    call PTHIS
    db "Enter X: ",0
    
    call scan_num 
    mov x,cx
    
    
    
    ;scan y  
    call pthis
    db "Enter y: ",0
    
    call scan_num
    mov y,cx
                   
    
    ;(x-1)^2 
    mov ax,x
    dec ax
    mul ax  
    mov mul_1,ax ;assuming DX wasn't needed 
 
    ;(y-1)^2 
    mov ax,y
    dec ax
    mul ax  
    mov mul_2,ax ; assuming DX was not needed
    
    
    ; x = (x-1)^2 + (y-1)^2
    
    add ax,mul_1 ; ax's latest value is mul_2
    
    mov x,ax ; assigning it to x
    mov dx,x ;
    
    mov ax,7000h
    mov ds,ax
    mov bx,01h
    mov ds:[bx],dx  ;stores in 70001h
    
            
 define_pthis
 define_scan_num
                 
 endp main
 end main