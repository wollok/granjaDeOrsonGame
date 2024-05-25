import wollok.game.*
import granjero.*
import exceptions.*

class Cultivo {
	const especie 

	method oroGanado() { return 0 }
	
	method image() { return "semilla.png" }


//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method cosechate() {
		granjero.sumaOro(self.oroGanado())
		game.removeVisual(self)
	}
	
	method precio() = especie.precio()
	method nombre() = especie.nombre()
}

class Especie {
	const property nombre
	const property precio
}
const maiz = new Especie(nombre = "maiz",precio = 150)
const trigo = new Especie(nombre = "trigo",precio = 100)
const tomate = new Especie(nombre = "tomate",precio = 50)

//class Maiz inherits Cultivo { 
//	constructor() = super("maiz", 150)
//}
//
//class Trigo inherits Cultivo {
//	constructor() = super("trigo", 100)
//}
//
//class Tomate inherits Cultivo {
//	constructor() = super("tomate", 50)
//}


object maizEjemplo inherits Cultivo(especie = maiz ) {
	override method oroGanado() = 150
	var property position = new Position(x = 3, y = 2) 
	
	override method image() = "maiz_adulto.png"
}