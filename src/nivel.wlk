import wollok.game.*
import exceptions.*
import granjero.*
import arbustos.*
import granero.*
import cultivos.*
import elementos.*
import tractor.*
import factories.*
import visuales.*

object nivel {

	method configurate() {
	//	CONFIGURACIÓN DEL JUEGO
		game.title("La granja de Orson")
		game.height(12)
		game.width(12)
		game.ground("piso.png")
			
		self.avance()
	
	//	VISUALES
	/*  
	 * Se le dice 'visual object' a todos los objetos que queremos mostrar en pantalla.
	 * Todo objeto visual deberá tener un atributo (o método getter) 'imagen' con el nombre del archivo de la imagen.
	 * Para dibujar el objeto en pantalla se puede agregar al tablero por medio del método 'drawElement(visual)' 
	 * 	que entienden las posiciones. Por ejemplo:
	 * 		var visual = object { 
	 * 			val imagen = "una_imagen.png" 
	 * 		}
	 * 		new Position(0,0).drawElement(visual)
	 *  
	 * Si queremos que nuestro objeto visual conozca en qué posición está del tablero, puede tener como atributo
	 * 	(o método getter) 'posicion' al objeto posición. En dicho caso, se puede agregar al tablero a través del
	 * 	método 'addVisual(visual)' que entiende game. Por ejemplo:
	 * 		var visual = object { 
	 * 			val imagen = "una_imagen.png" 
	 * 			var posicion = new Position(0,0)
	 * 		}
	 * 		game.addVisual(visual)
	 * 
	 * También se da la opción de agregar un 'personaje' al juego. Automáticamente el objeto podrá ser controlado
	 * 	con las flechas y éste hablará cuando ocurra algún error. Para ello se puede hablar con las posiciones o game
	 * 	a través de los mensajes 'drawCharacter(personaje)' y 'addVisualCharacter(personaje)' respectivamente. Solo
	 * 	se puede tener un personaje por juego.
	 * 
	 * Tener en cuenta que los visuales se van a imprimir por pantalla según el orden en el que son agregados, 
	 * 	de modo que el primer objeto va a quedar en la capa más inferior (puede ser tapado por todo el resto) y el 
	 * 	último en la capa más superior (siempre se va a mostrar).
	 */ 
	
		//	--------------ARBUSTOS--------------
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoAbajo(),new Position(n, 0)) } // bordeAbajo
		(1 .. ancho-1).forEach { n => arbustoFactory.draw(new ArbustoArriba(), new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoIzquierda(), new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach { n => arbustoFactory.draw(new ArbustoDerecha(), new Position(ancho, n)) } // bordeDer
	
		arbustoFactory.drawVerticalBlock(5, 5)
		[1, 9].forEach{ n => 
			arbustoFactory.drawVerticalBlock(5, n)
			arbustoFactory.drawHorizontalBlock(n, 5)
		}
		//	--------------ARBUSTOS--------------
	
		var elementos = [bolsa, espada, regadera]
		
	 	game.addVisualCharacter(granjeroVisual)
		
		elementos.forEach { it => game.addVisual(it) }
		
		game.addVisual(granero)
		
		new Position(3,2).drawElement(maizEjemplo)
		
		tractor.init(new Position(9,4))
		game.addVisual(tractor)
			
	//	TECLADO
	/*
	 * Como la mayoría de los juegos requiere del teclado para jugar, el lenguaje ofrece cada tecla modelada como un objeto. 
	 * Para eso es necesario importar el package 'wollok.game' con la siguiente línea de código, al principio del archivo:
	 * 		import wollok.game.*
	 * 
	 * Esto nos permite conocer a los 'key objects', los cuales se configuran a través del método 'onPressDo(bloque)' el
	 * 	cual recibe un bloque de código a ejecutar en caso de ser presionada durante el juego. Por ejemplo, si queremos
	 * 	que mario salte con la tecla 'S':
	 * 		S.onPressDo{ mario.salta() }
	 * 
	 * Si el juego cuenta con algún personaje, se puede configurar para que éste diga algo cuando se presiona una tecla. 
	 * Para ello las teclas entienden el método 'onPressCharacterSay(bloque)', donde el bloque de código que se pasa por parámetro
	 * 	debe retornar un string. Por ejemplo:
	 * 		SPACE.onPressCharacterSay{ "$ " + mario.monedasDeOro() }
	 */
	
		var usador = granjeroVisual
		
		A.onPressDo { game.say(granjeroVisual, "Tengo " + granjero.oro() + " monedas de oro") }
		SPACE.onPressDo { granjeroVisual.elemento().usate(usador) }
		
		ANY_KEY.onPressDo { usador = granjeroVisual }
	
	//	COLISIONES 	
		const gv = granjeroVisual
		game.whenCollideDo(tractor, { g =>  if (gv == g) tractor.comprate(granjeroVisual) })
		game.whenCollideDo(granero, { g =>  if (gv == g) usador = granero })
		
		elementos.forEach { it =>
			game.whenCollideDo(it, { g =>
				if (gv == g)
					if (!(granjeroVisual.posicion() === it.posicion()))
						granjeroVisual.agarrar(it)
			})
		}
	}

	method avance() {
		var mensaje = "Ya quiero irme de esta granja."
			
		try {
			granero.planta(new Maiz())
			granero.rega()
			granero.cosecha()
			granjero.restaOro(granjero.oro())
		}
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 7)
			mensaje = self.nivel4()
		}
		catch e {}
		
		try {
			granjero.rega(new Maiz())
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
		
		H.onPressDo{game.say(granjeroVisual, mensaje)}
	}
	
	method nivel1() = "Presiona la tecla 'A' para saber cuántas monedas de oro tengo."
	
	method nivel2() = "Presiona la tecla 'ESPACIO' para usar el elemento que tengas en la mano. Con la espada puedes cosechar los cultivos."

	method nivel3() = "Riega los cultivos para obtener más oro en la cosecha."

	method nivel4() = "Usa los elementos en el granero para aprovecharlos mejor"
}