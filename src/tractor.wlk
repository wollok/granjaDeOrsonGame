import wollok.game.*
object tractor {
	var n = 0
	var image = "tractor.png"	
	var position
	
	method init(_posicion) {
		position = _posicion
		_posicion.clear()
	}
	
	method comprate(granjero) {
		try {
			if (n==0)
				granjero.restaOro(800)
			self.win(granjero)
		} catch e {
			granjero.posicion().moveRight(1)
			throw e	
		}
	}
	
	method win(granjero) {
		image = "granjero_tractor.png"
		position = granjero.posicion()
		position.moveLeft(1)
		position.say(granjero, "Muchas gracias por ayudarme, nos vemos!")
		n+=1
		if (n>5) game.stop()
	}
}