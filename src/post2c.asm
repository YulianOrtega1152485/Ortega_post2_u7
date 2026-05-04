; post2c.asm
org 100h

start:
  mov ax, 0B800h
  mov es, ax

  ; fondo azul + texto blanco + espacio
  mov ax, 1720h

  xor di, di
  mov cx, 2000
  cld
  rep stosw

  ; escribir mensaje
  mov di, (12*80+30)*2
  mov si, msg

print:
  lodsb
  or al, al
  jz fin

  mov ah, 0Fh
  stosw
  jmp print

fin:
  mov ah, 07h
  int 21h

  mov ah, 4Ch
  int 21h

msg db "HOLA DESDE B800h",0