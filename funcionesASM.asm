global _agregar_abb
global _mostrar_abb
global _borrar_abb_con_valor
global _borrar_abb
extern _printf
extern _malloc
extern _free

section .data
viewNode db " { %d", 0
closeNode db "}", 0
emptyNode db " {}",0

section .text
agregoNodo:
    push edx
    push 12
    call _malloc
    add esp, 4 ;borro el parametro para pedir memoria
    pop edx
    
    mov [eax], edx ;guardo valor
    mov ebx, 0
    mov [eax + 4], ebx;seteo nodo a cero
    mov [eax + 8], ebx;seteo nodo a cero
    mov [ebp + 4], eax

    jmp finalizar

        
_agregar_abb:
    push ebp ; guardo base point
    mov ebp, esp ; mi nuevo base point es stack point
    ;push ebx ;guardo el registro que voy a usar para el puntero
    
    mov edx, [ebp + 12];valor parametro
    mov ebx, [ebp + 8];puntero nodo
    cmp ebx, 0 ;si es cero, es porque no hay nodo
    je agregoNodo;pedir memoria para nuevo nodo y guardar valor
    ;ebx valor nodo
    ;ebx + 4 puntero nodo izq
    ;ebx + 8 puntero nodo der
    cmp edx, [ebx];comparo valor parametro con valor nodo
    JE finalizar
    JG mover_der;IF greater
    jmp mover_izq
 
mover_izq:

    push edx; pusheo valor parametro
    mov eax, [ebx + 4];guardo nodo derecho para poder pushearlo
    push eax;pusheo nodo der
    call _agregar_abb;devuelve el nodo en EAX
    mov ebx, [ebp + 8];puntero nodo actual
    mov [ebx + 4], eax;agrego nodo nuevo
    mov eax,ebx;hago esto para que no pise los nodos de arriba
    add esp, 8 ; desapilo
    jmp finalizar
    
mover_der:

    push edx; pusheo valor parametro
    mov eax, [ebx + 8];guardo nodo der para poder pushearlo
    push eax;pusheo nodo der
    call _agregar_abb;devuelve el nodo en EAX
    mov ebx, [ebp + 8];puntero nodo actual
    mov [ebx + 8], eax;agrego nodo nuevo
    mov eax,ebx;hago esto para que no pise los nodos de arriba
    add esp, 8 ; desapilo
    jmp finalizar
      
finalizar:
    ;reinicio lo que apile
    ;pop ebx
    mov esp, ebp
    pop ebp
    ret
 
_mostrar_abb:
    push ebp ; guardo base point
    mov ebp, esp ; mi nuevo base point es stack point
    mov ebx, [ebp + 8];puntero nodo
    cmp ebx, 0 ;si es cero, es porque no hay nodo
    je mostrarVacio
    call mostrarInicioNodo
    push ebx;guardo nodo actual
    mov eax, [ebx +4];paso por parametro el nodo izq
    push eax
    call _mostrar_abb
    add esp, 4;saco el push de nodo izq
    pop ebx;recupero nodo actual
    mov eax, [ebx +8];paso por parametro el nodo derecho
    push eax
    call _mostrar_abb
    call mostrarFinNodo
    jmp finalizar

mostrarVacio:
    push eax
    push ebx
    push edx
    push emptyNode
    call _printf
    add esp, 4
    pop edx
    pop ebx
    pop edx
    jmp finalizar

mostrarInicioNodo:
    push eax
    push ebx
    push edx
    mov eax, [ebx]
    push eax
    push viewNode
    call _printf
    add esp, 8
    pop edx
    pop ebx
    pop edx
    ret

mostrarFinNodo:
    push eax
    push ebx
    push edx
    push closeNode
    call _printf
    add esp, 4
    pop edx
    pop ebx
    pop edx
    ret
    
_borrar_abb_con_valor:
    push ebp ; guardo base point
    mov ebp, esp ; mi nuevo base point es stack point
    ;push ebx ;guardo el registro que voy a usar para el puntero
    
    mov edx, [ebp + 12];valor parametro
    mov ebx, [ebp + 8];puntero nodo
    cmp ebx, 0 ;si es cero, es porque no hay nodo
    je finalizar ;finalizo, el nodo no se encuentra en el arbol
    ;ebx valor nodo
    ;ebx + 4 puntero nodo izq
    ;ebx + 8 puntero nodo der
    cmp edx, [ebx];comparo valor parametro con valor nodo
    JG borrar_mover_der;IF greater
    JL borrar_mover_izq
    jmp nodo_encontrado
    
    nodo_encontrado:
    push ebx
    call _borrar_abb	
    add esp, 4;saco el push
    jmp finalizar
    
    
borrar_mover_izq:
    push edx; pusheo valor parametro
    mov eax, [ebx + 4];guardo nodo derecho para poder pushearlo
    push eax;pusheo nodo der
    call _borrar_abb_con_valor;devuelve el nodo en EAX
    mov ebx, [ebp + 8];puntero nodo actual
    mov [ebx + 4], eax;agrego nodo nuevo
    mov eax,ebx;hago esto para que no pise los nodos de arriba
    add esp, 8 ; desapilo
    jmp finalizar
    
borrar_mover_der:
    push edx; pusheo valor parametro
    mov eax, [ebx + 8];guardo nodo der para poder pushearlo
    push eax;pusheo nodo der
    call _borrar_abb_con_valor;devuelve el nodo en EAX
    mov ebx, [ebp + 8];puntero nodo actual
    mov [ebx + 8], eax;agrego nodo nuevo
    mov eax,ebx;hago esto para que no pise los nodos de arriba
    add esp, 8 ; desapilo
    jmp finalizar
      
_borrar_abb:
    push ebp ; guardo base point
    mov ebp, esp ; mi nuevo base point es stack point
    
    mov ebx, [ebp + 8];puntero nodo
    cmp ebx, 0 ;si es cero, es porque no hay nodo
    je finalizar
    push ebx;guardo nodo actual
    mov eax, [ebx + 4];paso por parametro el nodo izq
    push eax
    call _borrar_abb	
    add esp, 4;saco el push de nodo izq
    pop ebx;recupero nodo actual
    push ebx ;guardo el nodo actual
    mov eax, [ebx + 8];paso por parametro el nodo derecho
    push eax
    call _borrar_abb	
    add esp, 4;saco el push de nodo der
    pop ebx;recupero nodo actual
    push ebx
    call _free ;libero el nodo actual
    add esp, 4 ;libero ebx
    jmp finalizar
    
    
    