import cultivos.*
import elementos.*

object granjero {
	val imagen = "player.png"
	var oro = 25
	var elemento = espada
	var cultivos = []
	var posicion = new Position(3, 3)
	
	method oro() = oro

	method usarElemento() { elemento.usar(this) }

	method cosecha() { this.cultivosDebajo().forEach { c => c.cosechate(this) } }

	method sumarOro(cantidad) { oro += cantidad }

	method plantar(cultivo) { cultivos.add(cultivo) }

	method rega() {
		this.cultivosDebajo().forEach { cultivo => cultivo.crece() }
	}	
	
	method cosechaTodo() {
		cultivos.forEach { c => c.cosechate(this) }
		cultivos.clear()
	}

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

	method agarrar(agarrable) {
		elemento.soltar() 
		elemento = agarrable
		agarrable.posicion(posicion)
	}

	method plantaMaiz() {
		this.planta(new Maiz())
	}

	method plantaTrigo() {
		this.planta(new Trigo())
	
	}
	method plantaTomaco() {
		this.planta(new Tomaco())
	}

	method planta(cultivo) {
		this.restarOro(25)
		this.plantar(cultivo)
		posicion.clone().drawElement(cultivo)
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
			
		if (_cultivos.isEmpty())
			throw new Exception("No hay cultivos aquí")
		
		return _cultivos
	}
	
	method getPosicion() = posicion
}
