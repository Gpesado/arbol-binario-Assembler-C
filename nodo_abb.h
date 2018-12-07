#ifndef NODO_ABB_H_INCLUDED
#define NODO_ABB_H_INCLUDED

struct nodo_abb
{
		int	valor;
		struct nodo_abb *izq;
		struct nodo_abb *der;
};

#endif // NODO_ABB_H_INCLUDED
