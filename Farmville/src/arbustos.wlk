class Arbusto {
	val imagen = "fence02.png"
}

class ArbustoArriba inherits Arbusto {
	method empuja(granjero) {
		granjero.getPosicion().moveDown(1)
	}
}

class ArbustoAbajo inherits Arbusto {
	method empuja(granjero) {
		granjero.getPosicion().moveUp(1)
	}
}

class ArbustoIzquierda inherits Arbusto {
	method empuja(granjero) {
		granjero.getPosicion().moveRight(1)
	}
}

class ArbustoDerecha inherits Arbusto {
	method empuja(granjero) {
		granjero.getPosicion().moveLeft(1)
	}
}
