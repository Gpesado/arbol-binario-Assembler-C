#include <stdio.h>
#include <io.h>
#include <stdlib.h>
#include "nodo_abb.h"
#include "Funciones.h"

int main(int argc, char *argv[])
{
    struct nodo_abb raiz;
    raiz.valor = 0;
	raiz.izq = 0;
	raiz.der = 0;
	struct nodo_abb AUX;
    int band = 1;
	int n = 0;
	while(band == 1)
    {
        band = scanf("%d\n",&n);
        if(band == 1)
        {
            if(raiz.valor == 0)
            {
                raiz.valor = n;
            }
			else
			{
				AUX = agregar_abb(&raiz,n);
			}
		}
    }

    mostrar_arbol_DFS(&raiz);

	borrar_abb(&raiz);

	return 0;
}
