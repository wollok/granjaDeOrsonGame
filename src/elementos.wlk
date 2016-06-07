import exceptions.*
import cultivos.*

object bolsa inherits Elemento(new Position(2,9), "bolsa.png") {

	method usate(plantador) { plantador.planta(self.cultivo()) }
	
	method cultivo() = [new Trigo(), new Maiz(), new Tomate()].anyOne()
}

object regadera inherits Elemento(new Position(9,2), "regadera.png") {

	method usate(regador) { regador.rega() }
}

object espada inherits Elemento(new Position(2,2), "espada.png") {

	method usate(cosechador) { cosechador.cosecha() }
}

class Elemento {
	const imagen
	const _posicionInicial
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