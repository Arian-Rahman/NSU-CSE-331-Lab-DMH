include "emu8086.inc"
.model small
.stack 100h
.data 
array dw 6,3,1,4,0,8,9,2,7,5     
len equ $-array
even dw 5 dup (?)
odd dw 5 dup (?)


.code
main proc
    mov ax,@data
    mov ds,ax  
    
    lea si,array
    lea di,even
    
    mov cx,len/2
    dec cx
    odd_loop: 
        cmp cx,0
        jl exit
           
        mov ax,cx
        mov bx,2d
        div bx ; div ax by 2 
        cmp dx,1 ; if odd
        je oddd:         
        jmp outt
        oddd:
          mov ax,[si]
          mov [di],ax
          inc di
          inc di
         outt:
         inc si
         inc si
         dec cx
    jmp odd_loop
    
  exit:   
    
   ; Second loop for even index
    
    mov cx,len/2
    dec cx   
    
    lea si,array
    lea di,odd     
    
    
    even_loop: 
        cmp cx,0
        jl exit_2
           
        mov ax,cx
        mov bx,2d
        div bx ; div ax by 2 
        cmp dx,0 ; if even
        je evenn:         
        jmp outtt
        evenn:
          mov ax,[si]
          mov [di],ax
          inc di
          inc di
         outtt:
         inc si
         inc si
         dec cx
    jmp even_loop

 exit_2:   
    
endp main
end main