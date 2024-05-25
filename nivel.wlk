import wollok.game.*
import exceptions.*
import granjero.*
import arbustos.*
import granero.*
import cultivos.*
import tractor.*
import factories.*
import visuales.*
import elementos.*
import movimiento.*

object nivel {

	method configurate() {
	//	CONFIGURACIÓN DEL JUEGO
		game.title("La granja de Orson")
		game.height(12)
		game.width(12)
		game.boardGround("piso.png")
			
		self.avance()
	
		//	--------------ARBUSTOS--------------
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoAbajo(position = new Position(x=n, y=0))) } // bordeAbajo
		(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoArriba(position = new Position(x=n, y=largo))) } // bordeArriba 
		(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoIzquierda(position = new Position(x=0, y=n))) } // bordeIzq 
		(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoDerecha(position = new Position(x=ancho, y=n))) } // bordeDer
	
		arbustoFactory.drawVerticalBlock(5, 5)
		[1, 9].forEach{ n => 
			arbustoFactory.drawVerticalBlock(5, n)
			arbustoFactory.drawHorizontalBlock(n, 5)
		}
		//	--------------ARBUSTOS--------------
	
		const elementos = [bolsa, espada, regadera]
		
	 	game.addVisual(granjeroVisual)
	 	movimiento.configurarFlechas(granjeroVisual)
		
		elementos.forEach { it => game.addVisual(it) }
		
		game.addVisual(granero)
		
		// game.addVisual(maizEjemplo) - hace que termine el juego
		game.addVisual(tractor)
			

	//	TECLADO
		var usador = granjeroVisual
		
		keyboard.a().onPressDo { game.say(granjeroVisual, "Tengo " + granjero.oro() + " monedas de oro") }
		keyboard.space().onPressDo { granjeroVisual.elemento().usate(usador) }
		
		keyboard.any().onPressDo { usador = granjeroVisual }
	
	//	COLISIONES 	
		const gv = granjeroVisual
		game.whenCollideDo(tractor, { g =>  if (gv == g) tractor.comprate(granjeroVisual) })
		game.whenCollideDo(granero, { g =>  if (gv == g) usador = granero })
		
		elementos.forEach { it =>
			game.whenCollideDo(it, { g =>
				if (gv == g)
					if (!(granjeroVisual.position() == it.position()))
						granjeroVisual.agarrar(it)
			})
		}
	}

	method avance() {
		var mensaje = "Ya quiero irme de esta granja."
			
		try {
			granero.planta(new Cultivo(especie = maiz))
			granero.rega()
			granero.cosecha()
			granjero.restaOro(granjero.oro())
		}
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 7)
			mensaje = self.nivel4()
		}
		catch e {	}
		
		try {
			granjero.rega(new Cultivo(especie = maiz))
		}
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(7, 5)
			mensaje = self.nivel3()
		}
		catch e {}
		
		try 
			granjero.cosecha(null)
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 3)
			mensaje = self.nivel2()
		}
		catch e {}
		
		try 
			granjero.oro()
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(3, 5)
			mensaje = self.nivel1()
		}
		catch e {}
		
		keyboard.h().onPressDo{game.say(granjeroVisual, mensaje)}
	}
	
	method nivel1() = "Presiona la tecla 'A' para saber cuántas monedas de oro tengo."
	
	method nivel2() = "Presiona la tecla 'ESPACIO' para usar el elemento que tengas en la mano. Con la espada puedes cosechar los cultivos."

	method nivel3() = "Riega los cultivos para obtener más oro en la cosecha."

	method nivel4() = "Usa los elementos en el granero para aprovecharlos mejor"
}