include "emu8086.inc"
.model small
.stack 100h
.data   
    str db "THIS.IS.A.PEN",0
    len equ $-str
    str1 db len+len/2 dup (?)   
    
.code

model proc   
         mov ax,@data
         mov ds,ax
         
         lea si,str
         lea di,str1
         mov cx,len
         
         traverse:
            mov al,[si]
            mov [di],al
            
            cmp al,21h    ;check range of punctuzation 
            jge checkRange
            jl skip
            
            checkRange:
            
           cmp al,2fh
           jle checkSpace  ;check range  of punctuzation 
           jg skip
           
           checkSpace:     ;if it's a punctuation , check if next one is space
            
            mov al,[si+1]
            cmp al,20h
            jne insertSpace 
            jmp skip 
            
            insertSpace:
               
               inc di
               mov al,20h
               mov [di],al
               
            
            skip:
            inc si
            inc di
             
            loop traverse  
            
      print "Input was : "
      lea si,str
      call print_string   
      
      printn " "
      
      print "Output string is : "
      lea si,str1
      call print_string   
            
            
            
    
define_print_string    
endp model
end model