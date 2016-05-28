import cultivos.*
import elementos.*
import exceptions.*

object granjero {
	var oro = 0

	/*
	 * Este método debe retornar la cantidad de oro que posee el granjero. 
	 */	
	method oro() {
		return throw new MethodNotImplemented("oro", self)
	}
	
	
	/*
	 * Para cosechar un cultivo basta con enviarle el mensaje 'cosechate()'.
	 */	
	method cosecha(cultivo) {
		throw new MethodNotImplemented("cosecha", self)
	}


	/*
	 * Al regar un cultivo éste crece. Mientras más crezca, más oro dará cuando se coseche.
	 */	
	method rega(cultivo) {
		throw new MethodNotImplemented("rega", self)
	}
	
	
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	
	method sumaOro(cantidad) { oro += cantidad }

	method restaOro(cantidad) {
		if (cantidad > oro)
			throw new Exception("No tengo suficiente oro para eso")
			
		oro -= cantidad
	}
}
