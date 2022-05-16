include "emu8086.inc"
.model small 
.stack 100h
.data
arr db 16 dup (?)
avg db 1 dup (?)
max db 1 dup (?)
min db 1 dup (?)
 
len equ 16

 .code 
 main proc   
    mov ax,@data
    mov ds,ax      
     
   lea si,arr
   mov cx,len   
   
;take input

  input:
   mov ah,01h
   int 21h
   
   mov [si],al
   inc si
   
   int 21h
   
   loop input 

   
;character conversion
   
   lea si,arr
   mov cx,len
   
   conv:
    mov al,[si]
    sub al,30h
    mov [si],al
    inc si      
    loop conv
   
;average 
    
    lea si,arr
    mov cx,len
    mov al,0
    
    sum:
       mov bl,[si]
       add al,bl
       inc si
    loop sum  
    
    mov ah,0 ; clear the ax part
    mov cl,len
    div cl  
    
    lea si,avg
    mov [si],al       ;store in avg
    
;min

    lea si,arr 
    mov bl,[si]; assume al has smallest one  
    mov cx,len   
    
    minn:
        cmp [si],bl
        jle small
        jmp skip
        small:
            mov bl,[si]
        skip: 
        inc si   
     loop minn        

  
 lea si,min 
 mov [si],bl ;store in min

     
;max

    lea si,arr 
    mov bl,[si]; assume al has biggest one  
    mov cx,len   
    
    maxx:
        cmp [si],bl
        jge big
        jmp skipp
        big:
            mov bl,[si]
        skipp: 
        inc si   
     loop maxx        
 
 lea si,max 
 mov [si],bl ;store in max
    
    
    
;enter + carriage return 
   mov ah,02h
   mov dl,0ah
   int 21h
   mov dl,0dh
   int 21h
   
    
    
     
;note everything works up until here , the data doesn't      
; get displayed from the arrays for some reason
   
   call PTHIS
   db "Average is",0   
    
   lea si,avg
   mov al,[si]
   sub al,30h
   mov ah,02h  
   mov dl,al
   int 21h 
    
   call PTHIS
   db "Min is",0  
   
   lea si,min  
   mov al,[si]
   sub al,30h
   mov ah,02h  
   mov dl,al
   int 21h 
   
   call PTHIS
   db "Max is",0   
   
   lea si,max
   mov al,[si] 
   sub al,30h
   mov ah,02h  
   mov dl,al
   int 21h 


    
define_pthis    
 endp main
 end main
