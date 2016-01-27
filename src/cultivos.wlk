import granjero.*
import exceptions.*

class Cultivo {
	var precio
	var nombre
	
	constructor(_nombre, _precio) {
		nombre = _nombre
		precio = _precio
	}

	method crece() { throw new MethodNotImplemented("crece", this) }
	
	method oroGanado() { return throw new MethodNotImplemented("oroGanado", this) }
	
	method getImagen() { return throw new MethodNotImplemented("getImagen", this) }


//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method cosechate() {
		granjero.sumaOro(this.oroGanado())
		wgame.removeVisual(this)
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

object maizEjemplo {
	method crece() { /* No hace nada */ }
	
	method oroGanado() = 150
	
	method getImagen() = "maiz_adulto.png"
}