.model small
.stack 100h
.data
 .code 
 main proc   
    mov ax,@data
    mov ds,ax
             
    mov ax,6000h   ;init base
    mov ds,ax
             
    mov al, 06d
    mov cl, 02d
    mul cl
    
    mov bx,01h
    mov ds:[bx],ax ;storing mult value to 60001h location
    
    mov al, 06d
    mov cl, 02d
    div cl
    
    mov bx,02h
    mov ds:[bx],ax; storing the quotient and remainder of division     
    
             
                 
                 
 endp main
 end main