; ------------------------------------------------
; get_memory_used_kb: Returns total used KB (kernel + apps) in AX
; Call this from CLI to get current memory usage
; ------------------------------------------------
get_memory_used_kb:
    push bx
    push cx
    push dx
    
    ; Get current heap/program allocation pointer
    ; You'll need to define where your OS tracks the current memory usage
    ; This assumes you have a heap_current or similar pointer
    
    mov ax, [heap_current]      ; Current allocation end
    sub ax, kernel_start        ; Subtract kernel start address
    
    ; Convert bytes to KB
    xor dx, dx
    mov bx, 1024
    div bx                      ; AX = used KB
    
    ; Store result
    mov [memory_used_kb], ax
    
    pop dx
    pop cx
    mov bx, ax
    ret

; Alternative version if you don't have heap tracking yet:
; This calculates based on end of kernel + estimate for loaded programs
get_memory_used_simple:
    push bx
    
    ; Get kernel size (from kernel start to end of BSS)
    mov ax, kernel_end
    sub ax, kernel_start
    
    ; Add estimate for loaded programs (you can make this more accurate)
    ; For now, assume each loaded program uses average 50KB
    mov bl, [programs_loaded_count]
    xor bh, bh
    mov cx, 50                  ; 50KB per program estimate
    mul cx                      ; BX * 50
    add ax, bx
    
    ; Convert to KB if result was in bytes
    ; (skip if already calculated in KB above)
    
    mov [memory_used_kb], ax
    
    pop bx
    ret

; Data you'll need to define in your kernel:
kernel_start        equ 0x8000      ; Adjust to your kernel start
kernel_end          equ 0x9000      ; Adjust to your kernel end
heap_current        dw 0x9000       ; Current allocation pointer
memory_used_kb      dw 0            ; Result storage
programs_loaded_count db 0          ; Number of loaded programs