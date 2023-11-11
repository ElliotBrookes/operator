print_hex:
;dx is where hex value is stored
    pusha 
    
    mov cx, TABLE
    call find_alpha
    mov [HEX_STRING + 2], bx ;register with nibble



    popa 
    mov bx, HEX_STRING
    call print_string
    ret

find_alpha:
    cmp cx, dx
    add cx, 1
    jne find_alpha

    mov bx, cx
    ret


print_string:
    pusha
    mov ah, 0x0e

    call print_char

    mov al, 0x0a
    int 0x10

    popa
    ret

print_char:
    mov al, [bx]
    add bx, 1
    int 0x10

    cmp al, 0
    jne print_char

    ret

; vars
TABLE: db "0123456789ABCDEF", 0
HEX_STRING: db '0x0000', 0


