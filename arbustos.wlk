class Arbusto {
	const property image = "arbusto.png"
	var property position
}

class ArbustoArriba inherits Arbusto {
	method empuja(granjero) {
		granjero.position(granjero.position().down(1))
	}
}

class ArbustoAbajo inherits Arbusto {
	method empuja(granjero) {
		granjero.position(granjero.position().up(1))
	}
}

class ArbustoIzquierda inherits Arbusto {
	method empuja(granjero) {
		granjero.position(granjero.position().right(1))
	}
}

class ArbustoDerecha inherits Arbusto {
	method empuja(granjero) {
		granjero.position(granjero.position().left(1))
	}
}