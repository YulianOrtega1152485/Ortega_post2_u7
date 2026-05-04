; post2b.asm
org 100h

start:
  mov ax, 0B800h
  mov es, ax

  ; H
  mov di, (10*80+35)*2
  mov byte [es:di], 'H'
  mov byte [es:di+1], 0Fh

  ; O
  mov di, (11*80+35)*2
  mov byte [es:di], 'O'
  mov byte [es:di+1], 0Eh

  ; L
  mov di, (12*80+35)*2
  mov byte [es:di], 'L'
  mov byte [es:di+1], 0Ah

  ; A
  mov di, (13*80+35)*2
  mov byte [es:di], 'A'
  mov byte [es:di+1], 0Ch

  mov ah, 07h
  int 21h

  mov ah, 4Ch
  int 21h