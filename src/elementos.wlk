import wollok.game.*
import exceptions.*
import cultivos.*

object bolsa inherits Elemento(game.at(2,9), "bolsa.png") {

	method usate(plantador) { plantador.planta(self.cultivo()) }
	
	method cultivo() = [new Trigo(), new Maiz(), new Tomate()].anyOne()
}

object regadera inherits Elemento(game.at(9,2), "regadera.png") {

	method usate(regador) { regador.rega() }
}

object espada inherits Elemento(game.at(2,2), "espada.png") {

	method usate(cosechador) { cosechador.cosecha() }
}

class Elemento {
	const property image
	const _posicionInicial
	var property position 
	
	constructor(posicionInicial, _imagen) {
		image = _imagen
		_posicionInicial = posicionInicial
		position = posicionInicial
	}
	
	method soltar() { 
		position = _posicionInicial
	}
	

}