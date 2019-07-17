import wollok.game.*
import granjero.*

object granjeroVisual {
	const image = "granjero.png"
	var position = new Position(2,9)
	var elemento
	
	method usarElemento() { elemento.usate(self) }
	
	method planta(cultivo) {
		self.restaOro(25)
		position.clone().drawElement(cultivo)
	}
	
	method rega() { granjero.rega(self.cultivosDebajo().head()) }

	method cosecha() { granjero.cosecha(self.cultivosDebajo().head()) }

	method restaOro(cantidad) { granjero.restaOro(cantidad) }
	
	method agarrar(agarrable) {
		if (elemento != null)
			elemento.soltar() 
		elemento = agarrable
		agarrable.posicion(position)
	}

	method cultivosDebajo() {
		var cultivos = position.allElements()
			.filter { obj => !(obj == self) }
			.filter { obj => !(obj == elemento) }
			
		if (cultivos.isEmpty())
			throw new Exception("No hay cultivos aquí")
		
		return cultivos
	}
	
	method posicion() = position
	method elemento() = elemento
}