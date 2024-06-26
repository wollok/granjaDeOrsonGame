import cultivos.*
import exceptions.*

object granjero {
	var oro = 0
	var property position = new Position(x = 0, y = 0)
	/*
	 * Este método debe retornar la cantidad de oro que posee el granjero. 
	 */	
	method oro() {
//		return throw new MethodNotImplemented(methodName="oro", aObject = self)
    return oro
	}
	
	
	/*
	 * Para cosechar un cultivo basta con enviarle el mensaje 'cosechate()'.
	 */	
	method cosecha(cultivo) {
		throw new MethodNotImplemented(methodName="cosecha", anObject = self)
	}


	/*
	 * Al regar un cultivo éste crece. Mientras más crezca, más oro dará cuando se coseche.
	 */	
	method rega(cultivo) {
		throw new MethodNotImplemented(methodName="rega", anObject = self)
	}
	
	
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method sumaOro(cantidad) { oro += cantidad }

	method restaOro(cantidad) {
		if (cantidad > oro)
			throw new Exception(message = "No tengo suficiente oro para eso")
			
		oro -= cantidad
	}
}
