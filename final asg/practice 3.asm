.MODEL SMALL
.STACK 100H      

.DATA   
arr db 5,2,8,9,12,3,1,6,13,15,7,10;
len equ $-arr  ; length of array   

zeros db 5 dup(?)
ones  db 5 dup(?)
twos  db 5 dup(?)


.CODE    


MAIN PROC  
    ;connecting the data portion to code segment 
    mov  ax,@data
    mov ds,ax 
    
    ;len-1
    mov ax,len
    dec ax
    mov len,ax  
     
    ;array pointer initialization 
    lea si,arr 
    lea di,zeros
    lea sp,ones
    lea bp,twos
      
    ;main loop  
    loop:     
    
     ;arr[i]%3
     mov ax,[si];moving value of arr[i] to ax 
     mov bl,3 ; loading devisor
     div bl; ax <= ax/bl , remainder is stored in AH
     
     cmp ah,0  ;compare for arr[i]%3 == 0
     jz z  ; jump to z if  zero flag is 1 
     jnz o ; jump to o if  zero flag is not 1 
     jmp t ; else jump to t
      
      ;if
      z:    
        mov ax,[si] ;move arr[i]'s value to ax
        mov [di],ax ; move ax's value to zeros array     
        inc di  ; increment index of zeros
        jmp there   ;jumps out of here  
        
      ;else if  
      o:   
        mov ax,[si];move arr[i]'s value to ax 
        mov [sp],ax ;move ax's value to ones array   
        inc sp   ; increment index of ones array
        jmp there   ;jumps out of here 
        
      ;else
      t:  
        mov ax,[si];move arr[i]'s value to ax 
        mov [bp],ax;move ax's value to ones array 
        inc bp  ; increment index of two 
     
     there:
     inc si  ;i++
     cmp si,len  ; i=0 to i=(length-1) 
     jl loop   ; jump back to main loop  as long as lesser than len
     
exit:
ENDP MAIN
END MAIN