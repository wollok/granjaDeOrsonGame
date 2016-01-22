import exceptions.*

object gorra inherits Elemento(new Position(2, 8), "spot.png") {

	method usar(granjero) { }
}

object espada inherits Elemento(new Position(1,1), "espada.gif") {

	method usar(granjero) {
		throw new MethodNotImplemented("usar", this)
//		granjero.cosecha()
	}
}

//object regadera inherits Elemento(new Position(3,1), "spot.png") {
//
//	override method usar(granjero) {
//		granjero.rega()
//	}
//}

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