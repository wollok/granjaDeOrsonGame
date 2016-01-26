import exceptions.*

object granero { 
	val imagen = "granero.png"
	val posicion = new Position(9,9)
	var cultivos = []
	
	method planta(cultivo) {
//		throw new MethodNotImplemented("planta", this)
		this.borde().forEach{ pos =>
			pos.drawElement(cultivo)
			cultivos.add(cultivo)
		}
	}
	
	method rega() { 
//		throw new MethodNotImplemented("rega", this)
		cultivos.forEach{ it => it.crece() }
	}

	method cosecha() { 
//		throw new MethodNotImplemented("cosecha", this)
		cultivos.forEach{ it => it.cocechate() }
	}
	
	method borde() {
		var x = 9
		var y = 9
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