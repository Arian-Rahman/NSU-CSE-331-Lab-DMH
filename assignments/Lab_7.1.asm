include "emu8086.inc"
.model small
.stack 100h
.data  
val db 10d
two equ 2
.code
main proc   
    
    mov ax,@data
    mov ds,ax
    
    lea si,val
    
    mov bx,0 ; counter 
    
    mov ax,[si]    
    mov cl,2d
    while:
         cmp  al,0      ; check quotient/vagfol
         je exit
         
         mov ax,[si]    ;take original number
         
         div cl  ; ah = remainder al = quotient 
         
         mov [si],al  
         
         ;move remainder to stack
         mov dx,0
         mov dl,ah
         push dx
         inc bx
             
    jmp while
    
    exit:
    
    mov cx,bx
    
    print: 
          pop bx
          mov ax,bx
          CALL Print_num_UNS
    
    loop print
    
 
    
DEFINE_PRINT_NUM_UNS    
endp main
end main