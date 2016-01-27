import exceptions.*

object granero { 
	val imagen = "granero.png"
	val posicion = new Position(9,9)
	
	method planta(_cultivo) {
		throw new MethodNotImplemented("planta", this)
	}
	
	method rega() { 
		throw new MethodNotImplemented("rega", this)
	}

	method cosecha() { 
		throw new MethodNotImplemented("cosecha", this)
	}
	
	method borde() {
		var x = posicion.getX()
		var y = posicion.getY()
		return [
			new Position(x-1,y-1),
			new Position(x,y-1),
			new Position(x+1,y-1),
			new Position(x+1,y),
			new Position(x+1,y+1),
			new Position(x,y+1),
			new Position(x-1,y+1),
			new Position(x-1,y)
		]
	}
}