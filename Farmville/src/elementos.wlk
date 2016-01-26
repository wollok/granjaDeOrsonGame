import exceptions.*

object bolsa inherits Elemento(new Position(2,9), "bolsa.png") {

	method usar(granjero) { /* No hace nada */ }
}

object espada inherits Elemento(new Position(2,2), "espada.png") {

	method usar(granjero) {
		granjero.cosechaTodo()
	}
}

object regadera inherits Elemento(new Position(9,2), "regadera.png") {

//	method usar(granjero) {
//		granjero.cosechaTodo()
//	}
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