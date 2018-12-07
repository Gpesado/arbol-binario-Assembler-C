#include <stdio.h>
#include <io.h>
#include <stdlib.h>
#include "nodo_abb.h"
#include "Funciones.h"

struct ​nodo_abb​ ​agregar_abb(struct ​nodo_abb​ ​*arbol,​ ​int​ ​val);
void mostrar_abb(struct nodo_abb *);
void borrar_abb(struct nodo_abb *);

int main(int argc, char *argv[])
{
    mensajeBienvenida();

    struct nodo_abb raiz;
    raiz.valor = 0;
	raiz.izq = 0;
	raiz.der = 0;
	struct nodo_abb AUX;
    int band = 0;
	while(band == 0)
    {
        printf("Ingrese un numero o un $ para terminar el ingreso: ");
        char cadena [10];
        recibirCadena(cadena);
        if(esNumero(cadena) == 1)
        {
            if(raiz.valor == 0)
            {
                raiz.valor = stringToInt(cadena);
            }
            AUX = agregar_abb(&raiz,stringToInt(cadena));
        }
        else
        {
            if(esSignoPeso(cadena) == 1)
            {
                band = 1;
            }
            else
            {
                printf("Ingreso incorrecto vuelva a ingresar el numero\n");
            }
        }
    }
    printf("\n");
    printf("Asi se veria el arbol que acabo de crear usando el metodo en .ASM \n");
    mostrar_abb(&raiz);
    printf("\n");
    printf("\n");
    printf("Asi se veria en DFS implementado en .C\n");
    printf("\n");
    mostrar_arbol_DFS(&raiz);
    printf("\n");
    printf("Ahora vamos a ver como queda el arbol con el borrar implementado en .ASM\n");
    if(raiz.izq != 0)
    {
        borrar_abb(raiz.izq);
		raiz.izq = 0;
        printf("Para esto vamos a borrar toda la rama izquierda del arbol\n");

    }
    else if(raiz.der != 0)
    {
        borrar_abb(raiz.der);
		raiz.der = 0;
        printf("Para esto vamos a borrar toda la rama derecha del arbol\n");
    }
    else
    {
        printf("Como la raiz del arbol no posee hijos, no borraremos ningun nodo\n");
        printf("Simplemente vamos a mostrar el arbol\n");
    }
    printf("\n");
    printf("Asi se veria el arbol modificado usando el metodo en .ASM \n");
    mostrar_abb(&raiz);
    printf("\n");
    printf("\n");
    printf("Asi se veria en DFS implementado en .C\n");
    printf("\n");
    mostrar_arbol_DFS(&raiz);
    printf("\n");

	borrar_abb(&raiz);

    printf("Muchas gracias utilizar el programa!! \n");
    printf("Creadores: Pesado, Gonzalo - Vargas, Lucas \n");
    finPrograma();

	getchar();
    getch();
	return 0;
}


