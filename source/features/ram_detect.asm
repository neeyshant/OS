; ------------------------------------------------
; get_total_memory_kb: Returns total usable KB in AX
; ------------------------------------------------

get_memory_simple:
    push bx
    push cx
    push dx
    
    ; Try E801 first (more reliable for smaller amounts)
    mov ax, 0xE801
    int 0x15
    jc try_88
    
    ; AX = KB between 1MB-16MB, BX = 64KB blocks above 16MB
    ; Convert BX to KB and add to AX
    push ax                       ; Save low memory
    mov ax, bx
    mov dx, 64
    mul dx                        ; AX = BX * 64 (convert to KB)
    mov bx, ax                    ; BX = high memory in KB
    pop ax                        ; Restore low memory
    add ax, bx                    ; Total = low + high
    add ax, 1024                  ; Add first 1MB
    jmp memory_done

try_88:
    ; Fallback to INT 15h AX=8800h (older method)
    mov ah, 0x88
    int 0x15
    jc memory_error
    add ax, 1024                  ; Add first 1MB
    jmp memory_done

memory_error:
    mov ax, 1024                  ; Default to 1MB if all else fails

memory_done:
    mov [total_memory_kb], ax
    pop dx
    pop cx  
    pop bx
    mov ax, [total_memory_kb]
    ret

; Data section
memory_map_buffer: times 24 db 0
total_memory_kb: dw 0