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
//		this.cosecha(cultivos)
		cultivo.cosechate()
//		this.cosecha(this.cultivosDebajo())
	}

	method rega(cultivo) {
//		throw new MethodNotImplemented("rega", this)
		cultivo.crece()
//		this.cultivosDebajo().forEach { cultivo => cultivo.crece() }
	}
	
	method sumarOro(cantidad) { oro += cantidad }

	method restarOro(cantidad) {
		if (cantidad > oro)
			throw new Exception("No tengo suficiente dinero para eso")
			
		this.sumarOro(-cantidad)
	}
}
