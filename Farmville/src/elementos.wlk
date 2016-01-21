object espada inherits Elemento(new Position(1,1), "espada.gif") {

	override usar(granjero) {
		granjero.rega()
	}
}

object regadera inherits Elemento(new Position(3,1), "spot.png") {

	override usar(granjero) {
		granjero.rega()
	}
}

object candado inherits Elemento(new Position(3,1), "spot.png") {

	override usar(granjero) {
		granjero.rega()
	}
}


class Elemento {
	val imagen
	val _posicionInicial
	var posicion 
	
	constructor(posicionInicial, _imagen) {
		imagen = _imagen
		_posicionInicial = posicionInicial
		posicion = posicionInicial
	}
	
	method usar(granjero) {
		throw new Exception("Not implemented")
	}
	
	method soltar() { 
		posicion = _posicionInicial
	}

	method posicion(p) { 
		posicion = p
	}
	
	method posicion() = posicion
}