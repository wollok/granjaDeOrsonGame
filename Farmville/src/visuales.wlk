import granjero.*
import elementos.*

object granjeroVisual {
	val imagen = "granjero.png"
	var posicion = new Position(2,9)
	var elemento
	
	method usarElemento() { elemento.usate(this) }
	
	method planta(cultivo) {
		this.restarOro(25)
		posicion.clone().drawElement(cultivo)
	}
	
	method rega() { granjero.rega(this.cultivosDebajo().head()) }

	method cosecha() { granjero.cosecha(this.cultivosDebajo().head()) }

	
	method sumarOro(cantidad) { granjero.sumarOro(cantidad) }

	method restarOro(cantidad) { granjero.restarOro(cantidad) }
	
	method agarrar(agarrable) {
		if (elemento != null)
			elemento.soltar() 
		elemento = agarrable
		agarrable.posicion(posicion)
	}

	method cultivosDebajo() {
		var cultivos = posicion.allElements()
			.filter { obj => !(obj == this) }
			.filter { obj => !(obj == elemento) }
			
//		if (cultivos.isEmpty())
//			throw new Exception("No hay cultivos aquí")
		
		return cultivos
	}
	
	method posicion() = posicion
	method elemento() = elemento
}