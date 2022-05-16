.model small
.stack 100h

.data

arr db 5,2,8,9,12,3,1,6,13,15,7,10 
len equ $-arr

zeros db 5 dup(?) 
ones db 5 dup(?)
twos db 5 dup(?)

index_for_zeros dw 0
index_for_ones dw 0
index_for_twos dw 0

.code 

insert macro index
    
    mov di, index
    mov al, [si]
    mov [di], al           
    
    inc index
    
    jmp back 
    
endm insert

main proc
    
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    
    lea di, zeros
    mov index_for_zeros, di
    
    lea di, ones
    mov index_for_ones, di
    
    lea di, twos
    mov index_for_twos, di
    
    mov dl, 3
    
    mov cx, len
    
    traverse:
    
        cmp cx, 0
        je exit:
        
        mov ah, 0
        mov al, [si]
        
        div dl
        
        cmp ah, 1
        je insert_one
        jl insert_zero
        jg insert_two
        
        back:
        inc si
        dec cx        
    
    jmp traverse ; cx--   
    
    hlt
    
    insert_zero:
    insert index_for_zeros
    
    insert_one:
    insert index_for_ones
    
    insert_two:
    insert index_for_twos
    
    exit:

endp main
end main