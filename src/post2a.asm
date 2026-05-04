; post2a.asm
org 100h

section .data
  prompt  db "Pulse una tecla (ESC para salir): $"
  msgScan db "  Scan: $"
  msgAscii db "  ASCII: $"
  crlf    db 0Dh, 0Ah, "$"

section .text
start:
  mov ah, 09h
  mov dx, prompt
  int 21h

leer:
  mov ah, 00h
  int 16h          ; AH=scan, AL=ASCII

  mov bl, ah       ; scan
  mov bh, al       ; ascii

  cmp bl, 01h      ; ESC
  je fin

  ; mostrar scan
  mov ah, 09h
  mov dx, msgScan
  int 21h

  mov al, bl
  call printHex

  ; mostrar ascii
  mov ah, 09h
  mov dx, msgAscii
  int 21h

  mov al, bh
  call printHex

  mov ah, 09h
  mov dx, crlf
  int 21h

  jmp leer

fin:
  mov ah, 4Ch
  int 21h

; ---- imprimir AL en hex ----
printHex:
  push ax
  mov ah, al

  shr al, 4
  call nibble

  mov dl, al
  mov ah, 02h
  int 21h

  pop ax
  and al, 0Fh
  call nibble

  mov dl, al
  mov ah, 02h
  int 21h
  ret

nibble:
  cmp al, 9
  jle digit
  add al, 37h
  ret
digit:
  add al, 30h
  ret