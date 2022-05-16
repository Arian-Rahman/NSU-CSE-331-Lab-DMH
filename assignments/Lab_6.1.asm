.model small 
.stack 100h
.data
 matrix db 1,2,3
 cols equ $-matrix
        db 4,5,6 
        db 7,8,9
        db 2,3,4
 len equ $-matrix
 
 trans db 4 dup(?)
       db 4 dup(?)
       db 4 dup(?)
       db 4 dup(?)
 
 .code 
 main proc   
    mov ax,@data
    mov ds,ax      
    
    
    lea di,trans
    lea bx,matrix
    add bx,len 
    
    mov cx,cols
    mov dx,0
    
    outer: 
        lea si,matrix 
        add si,dx
        
        inner:
            cmp si,bx
            jge break
        
            mov al,[si]
            mov [di],al
        
            add si,cols
            inc di
        
      jmp inner
      break:
      inc dx
      loop outer
    
 endp main
 end main