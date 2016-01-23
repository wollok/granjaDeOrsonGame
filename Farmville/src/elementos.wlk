import exceptions.*

object gorra inherits Elemento(new Position(2,9), "spot.png") {

	method usar(granjero) { /* No hace nada */ }
}

object espada inherits Elemento(new Position(2,2), "espada.gif") {

	method usar(granjero) {
		granjero.cosechaTodo()
	}
}

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

class Elemento {
	val imagen
	val _posicionInicial
	var posicion 
	
	constructor(posicionInicial, _imagen) {
		imagen = _imagen
		_posicionInicial = posicionInicial
		posicion = posicionInicial
	}
	
	method soltar() { 
		posicion = _posicionInicial
	}

	method posicion(p) { 
		posicion = p
	}
	
	method posicion() = posicion
}