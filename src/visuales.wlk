import wollok.game.*
import granjero.*

object granjeroVisual {
	const property image = "granjero.png"
	var property position = game.at(2,9)
	var property elemento
	
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
		agarrable.position(position)
	}

	method cultivosDebajo() {
		var cultivos = position.allElements()
			.filter { obj => !(obj == self) }
			.filter { obj => !(obj == elemento) }
			
		if (cultivos.isEmpty())
			throw new Exception(message="No hay cultivos aquí")
		
		return cultivos
	}
	
}