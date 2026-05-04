; post2d.asm
org 100h

start:
  mov ax, 0B800h
  mov es, ax

  mov dl, 0          ; columna
  mov dh, 12         ; fila

leer:
  mov ah, 00h
  int 16h            ; AL = ASCII

  cmp al, 0Dh        ; ENTER
  je fin

  cmp al, 0
  je leer            ; ignorar teclas especiales

  ; calcular offset = (fila*80 + col)*2
  mov ax, dx
  mov bx, 80
  mul bx
  add ax, dx         ; dx=columna (dl)
  shl ax, 1
  mov di, ax

  ; escribir caracter
  mov [es:di], al
  mov byte [es:di+1], 0Fh

  inc dl
  cmp dl, 80
  jl leer

  mov dl, 0
  jmp leer

fin:
  mov ah, 4Ch
  int 21h