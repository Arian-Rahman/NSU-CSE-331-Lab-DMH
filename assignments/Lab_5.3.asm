
include "emu8086.inc"
.model small
.stack 100h
.data    
 
 f dw 24 dup (?)  ; 8086 can only count upto 24th fibonacchi

.code 
 main proc  
    
  mov ax,@data
  mov ds,ax
  
  lea si,f
  mov [si],1
  add si,2
  mov [si],1  
  add si,2
  
  mov cx,22
  
  fib:
     mov ax,[si]-2
     mov bx,[si]-4
     add ax,bx
     
     mov [si],ax
     add si,2
                  
  loop fib        
  
mov ax,[si]-2  
    
                 
 endp main
 end main