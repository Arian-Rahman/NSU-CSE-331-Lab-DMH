include "emu8086.inc"
.model small
.stack 100h
.data  
arr dw 5,2,8,9,12,3   
len equ $-arr
even dw 0
odd dw 0 
.code

main proc
      mov ax,@data
      mov ds,ax   
       
      lea si,arr 
      mov cx,len/2
      
      for: 
        mov ah,0h
        mov ax,[si] 
        
        mov bx,02d     
        div bx
        cmp dx,1 ;comp remainder to 1  
        je oddd
        jmp evenn
        evenn: 
            mov ax,[si]
            add even,ax
            jmp out
        oddd:  
            mov ax,[si]
            add odd,ax
        out:    
        inc si
        inc si
      loop for   
    
  lea si,odd  
  mov ax,[si] 
  CALL Print_num_UNS
 


    print " "

  lea si,even 
  mov ax,[si]
  CALL Print_NUM_UNS
  
    
      
      
DEFINE_PRINT_NUM_UNS              
endp main
end main
