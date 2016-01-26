import cultivos.*
import elementos.*
import exceptions.*

object granjero {
	val imagen = "granjero.png"
	var posicion = new Position(2,9)
	var oro = 0
	var cultivos = []
	var elemento = bolsa
	
	method oro() {
//		return throw new MethodNotImplemented("oro", this)
		return oro
	}

	method usarElemento() { 
//		throw new MethodNotImplemented("usarElemento", this)
		elemento.usar(this)
	}

	method cosecha(_cultivos) { 
		_cultivos.forEach { c => 
			c.cosechate()
			_cultivos.remove(c)
		}
	}
	
	method cosechaTodo() {
		this.cosecha(cultivos)
//		this.cosecha(this.cultivosDebajo())
	}

	method rega() {
//		throw new MethodNotImplemented("rega", this)
		this.cultivosDebajo().forEach { cultivo => cultivo.crece() }
	}



	method agregarCultivo(cultivo) { cultivos.add(cultivo) }

	method sumarOro(cantidad) { oro += cantidad }

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

	method agarrar(agarrable) {
		elemento.soltar() 
		elemento = agarrable
		agarrable.posicion(posicion)
	}
	
	method planta(cultivo) {
		this.restarOro(25)
		this.agregarCultivo(cultivo)
	}

	method restarOro(cantidad) {
		if (cantidad > oro)
			throw new Exception("No tengo suficiente dinero para eso")
			
		this.sumarOro(-cantidad)
	}
	
	method cultivosDebajo() {
		var _cultivos = posicion.allElements()
			.filter { obj => !(obj == this) }
			.filter { obj => !(obj == elemento) }
			
//		if (_cultivos.isEmpty())
//			throw new Exception("No hay cultivos aquí")
		
		return _cultivos
	}
	
	method posicion() = posicion
}
