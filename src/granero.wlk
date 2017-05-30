import exceptions.*

object granero { 
	const imagen = "granero.png"
	const posicion = new Position(9,9)
	
	/*
	 * Cuando se le pride al granero que plante un cultivo éste lo planta a su alrededor.
	 * Para eso el granero entiende el mensaje 'borde()' que retorna una lista de posiciones donde se platará
	 * el cultivo. Para meter un objeto al tablero existe el mensaje 'drawElement(visual)' que entiende
	 * las posiciones.
	 */
	method planta(_cultivo) {
		throw new MethodNotImplemented("planta", self)
	}
	
	
	/*
	 * Debe hacer crecer todos los cultivos que plantó el granero
	 */
	method rega() { 
		throw new MethodNotImplemented("rega", self)
	}


	/*
	 * Debe cosechar todos los cultivos que plantó el granero
	 */
	method cosecha() { 
		throw new MethodNotImplemented("cosecha", self)
	}
	

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method borde() {
		var x = posicion.x()
		var y = posicion.y()
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
