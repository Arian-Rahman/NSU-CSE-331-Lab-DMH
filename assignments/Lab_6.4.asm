include "emu8086.inc"
.model small 
.stack 100h
.data
str db 6 dup (?)  
key db 1 dup (?)
 
len equ 6

 .code 
 main proc   
    mov ax,@data
    mov ds,ax      
     
   lea si,str
   mov cx,len   
   
;take string input

   call PTHIS
   db "Enter 6 letter string",0  
  
 ;new line 
   mov ah,02h
   mov dl,0ah
   int 21h
   mov dl,0dh
   int 21h
   
    
   input:
    mov ah,01h
    int 21h 
    mov [si],al
    inc si
   
   loop input   
 
 ;new line 
   mov ah,02h
   mov dl,0ah
   int 21h
   mov dl,0dh
   int 21h   
   
;take char input
   call PTHIS
   db "Enter character to search ",0  
  
 ;new line 
   mov ah,02h
   mov dl,0ah
   int 21h
   mov dl,0dh
   int 21h
   
   lea si,key
   mov ah,01h
   int 21h
   mov [si],al
   inc si
   
   

 lea si,str
 lea di,key 
 mov al,[di]
 mov cx,len  
 inc cx
 mov dl,0
 comp:   
    cmp  al,[si]
    je  break
    inc dl
    inc si
   loop comp
jmp exit
break:   
    call PTHIS
    db "The character was found at position : ",0
    mov ah,02h 
    sub dl,30h
    int 21h     
exit:
     

;   
;;character conversion
;   
;   lea si,arr
;   mov cx,len
;   
;   conv:
;    mov al,[si]
;    sub al,30h
;    mov [si],al
;    inc si      
;    loop conv
;   
;;average 
;    
;    lea si,arr
;    mov cx,len
;    mov al,0
;    
;    sum:
;       mov bl,[si]
;       add al,bl
;       inc si
;    loop sum  
;    
;    mov ah,0 ; clear the ax part
;    mov cl,len
;    div cl  
;    
;    lea si,avg
;    mov [si],al       ;store in avg
;    
;;min
;
;    lea si,arr 
;    mov bl,[si]; assume al has smallest one  
;    mov cx,len   
;    
;    minn:
;        cmp [si],bl
;        jle small
;        jmp skip
;        small:
;            mov bl,[si]
;        skip: 
;        inc si   
;     loop minn        
;
;  
; lea si,min 
; mov [si],bl ;store in min
;
;     
;;max
;
;    lea si,arr 
;    mov bl,[si]; assume al has biggest one  
;    mov cx,len   
;    
;    maxx:
;        cmp [si],bl
;        jge big
;        jmp skipp
;        big:
;            mov bl,[si]
;        skipp: 
;        inc si   
;     loop maxx        
; 
; lea si,max 
; mov [si],bl ;store in max
;    
;    
;    
;;enter + carriage return 
;   mov ah,02h
;   mov dl,0ah
;   int 21h
;   mov dl,0dh
;   int 21h
;   
;    
;    
;     
;;note everything works up until here , the data doesn't      
;; get displayed from the arrays for some reason
;   
;   call PTHIS
;   db "Average is",0   
;    
;   lea si,avg
;   mov al,[si]
;   sub al,30h
;   mov ah,02h  
;   mov dl,al
;   int 21h 
;    
;   call PTHIS
;   db "Min is",0  
;   
;   lea si,min  
;   mov al,[si]
;   sub al,30h
;   mov ah,02h  
;   mov dl,al
;   int 21h 
;   
;   call PTHIS
;   db "Max is",0   
;   
;   lea si,max
;   mov al,[si] 
;   sub al,30h
;   mov ah,02h  
;   mov dl,al
;   int 21h 
;
;
    
define_pthis    
 endp main
 end main