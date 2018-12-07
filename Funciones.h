#ifndef FUNCIONES_H_INCLUDED
#define FUNCIONES_H_INCLUDED
#include <string.h>

void mensajeBienvenida()
{
    printf("Organizacion del computador II, TP1\n");
    printf("ARBOL BINARIO DE BUSQUEDA CON C Y ASM\n");
    printf("Docente: Carlos Holtman\n");
    printf("Alumnos: Lucas Vargas y Gonzalo Pesado\n");
    printf("\n");
}

void finPrograma()
{
    printf("Presiona una tecla para salir");
}

char * recibirCadena( char *cadena )
{
    scanf("%9s",cadena);
    return cadena;
}

int esNumero(char * cadena)
{
    int i = 0;
    while(cadena[i] != '\0')
    {
        if( cadena[i] < 48 || cadena[i] > 57)
        {
            if(i == 0 && cadena[i] == 45) i = i;
            else return 0;
        }
        i = i+1;
    }
    return 1;
}

int esSignoPeso(char * cadena)
{
    if (strlen(cadena) == 1)
        if(cadena[0] == 36)
            return 1;
    return 0;

}

int stringToInt(char *cadena)
{
    return atoi(cadena);
}

void mostrar_arbol(struct nodo_abb *nodo){
    if(nodo != 0){
        if(nodo->izq != 0){
            mostrar_arbol(nodo->izq);
        }
        printf("%d\n",nodo->valor);
        if(nodo->der != 0){
            mostrar_arbol(nodo->der);
        }
    }
}

void mostrar_arbol_DFS(struct nodo_abb *nodo)
{
    if(nodo != 0){
        if(nodo->izq != 0){
            mostrar_arbol(nodo->izq);
        }
        printf("%d\n",nodo->valor);
        if(nodo->der != 0){
            mostrar_arbol(nodo->der);
        }
    }
}


#endif // FUNCIONES_H_INCLUDED
