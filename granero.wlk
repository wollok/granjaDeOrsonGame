import wollok.game.*
import exceptions.*

object granero { 
	const property image = "granero.png"
	const property position = game.at(9,9)
	
	/*
	 * Cuando se le pride al granero que plante un cultivo éste lo planta a su alrededor.
	 * Para eso el granero entiende el mensaje 'borde()' que retorna una lista de posiciones donde se platará
	 * el cultivo. Para meter un objeto al tablero existe el mensaje 'drawElement(visual)' que entiende
	 * las posiciones.
	 */
	method planta(_cultivo) {
		throw new MethodNotImplemented(methodName= "planta", anObject = self)
	}
	
	
	/*
	 * Debe hacer crecer todos los cultivos que plantó el granero
	 */
	method rega() { 
		throw new MethodNotImplemented(methodName="rega", anObject = self)
	}


	/*
	 * Debe cosechar todos los cultivos que plantó el granero
	 */
	method cosecha() { 
		throw new MethodNotImplemented(methodName="cosecha", anObject = self)
	}
	

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method borde() {
		const x = position.x()
		const y = position.y()
		return [
			new Position(x=x-1,y=y-1),
			new Position(x=x,y=y-1),
			new Position(x=x+1,y=y-1),
			new Position(x=x+1,y=y),
			new Position(x=x+1,y=y+1),
			new Position(x=x,y=y+1),
			new Position(x=x-1,y=y+1),
			new Position(x=x-1,y=y)
		]
	}
}
