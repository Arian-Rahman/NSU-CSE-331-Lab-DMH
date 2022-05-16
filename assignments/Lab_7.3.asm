include "emu8086.inc"
.model small
.stack 100h
.data  

    arr db 11,0,1,2,3,4,5,6,7,13  
    len equ 10
.code
main proc
          
     mov ax,@data
     mov ds,ax
     
     lea si,arr
     mov cx,len
     
    
     
     ;assume al always had the highest value 
     mov al,[si]
     
     for:  
          
          mov bl,[si+1]
          
          cmp al,bl
          jl swap
          jmp skip
          swap:
          xchg al,bl 
         ; inc si
;          inc si
          
          skip:
          inc si
     
     loop for
     
     
         
         
endp main
end main 