import wollok.game.*
import granjero.*
import exceptions.*

class Cultivo {
	var precio
	var nombre
	
	constructor(_nombre, _precio) {
		nombre = _nombre
		precio = _precio
	}

	method oroGanado() { return 0 }
	
	method image() { return "semilla.png" }


//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method cosechate() {
		granjero.sumaOro(self.oroGanado())
		game.removeVisual(self)
	}
	
	method precio() = precio
	method nombre() = nombre
}


class Maiz inherits Cultivo { 
	constructor() = super("maiz", 150)
}

class Trigo inherits Cultivo {
	constructor() = super("trigo", 100)
}

class Tomate inherits Cultivo {
	constructor() = super("tomate", 50)
}

object maizEjemplo inherits Cultivo("maiz", 150) {
	override method oroGanado() = 150
	
	override method image() = "maiz_adulto.png"
}