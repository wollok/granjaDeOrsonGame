import cultivos.*
import elementos.*
import exceptions.*

object granjero {
	var oro = 0
	
	method oro() {
//		return throw new MethodNotImplemented("oro", this)
		return oro
	}
	
	method cosecha(cultivo) {
//		throw new MethodNotImplemented("cosecha", this)
		cultivo.cosechate()
	}

	method rega(cultivo) {
//		throw new MethodNotImplemented("rega", this)
		cultivo.crece()
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
