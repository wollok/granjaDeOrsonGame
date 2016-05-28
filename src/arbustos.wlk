class Arbusto {
	const imagen = "arbusto.png"
}

class ArbustoArriba inherits Arbusto {
	method empuja(granjero) {
		granjero.posicion().moveDown(1)
	}
}

class ArbustoAbajo inherits Arbusto {
	method empuja(granjero) {
		granjero.posicion().moveUp(1)
	}
}

class ArbustoIzquierda inherits Arbusto {
	method empuja(granjero) {
		granjero.posicion().moveRight(1)
	}
}

class ArbustoDerecha inherits Arbusto {
	method empuja(granjero) {
		granjero.posicion().moveLeft(1)
	}
}