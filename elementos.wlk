import wollok.game.*
import exceptions.*
import cultivos.*

object bolsa inherits Elemento (
	posicionInicial = game.at(2, 9),
	image = "bolsa.png"
) {
	method usate(plantador) {
		plantador.planta(self.cultivo())
	}
	
	method cultivo() = [
		new Cultivo(especie = trigo),
		new Cultivo(especie = maiz),
		new Cultivo(especie = tomate)
	].anyOne()
}

object regadera inherits Elemento (
	posicionInicial = game.at(9, 2),
	image = "regadera.png"
) {
	method usate(regador) {
		regador.rega()
	}
}

object espada inherits Elemento (
	posicionInicial = game.at(2, 2),
	image = "espada.png"
) {
	method usate(cosechador) {
		cosechador.cosecha()
	}
}

class Elemento {
	const property image
	const posicionInicial
	var property position
	
	method initialize() {
		position = posicionInicial
	}
	
	method soltar() {
		position = posicionInicial
	}
}