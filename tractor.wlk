import wollok.game.*
object tractor {
	var n = 0
	var image = "tractor.png"	
	var position
	
	method init(_position) {
		position = _position
		_position.clear()
	}
	
	method comprate(granjero) {
		try {
			if (n==0)
				granjero.restaOro(800)
			self.win(granjero)
		} catch e {
			granjero.position(granjero.position().right(1))
			throw e	
		}
	}
	
	method win(granjero) {
		image = "granjero_tractor.png"
		position = granjero.position()
		position = position.left(1)
		position.say(granjero, "Muchas gracias por ayudarme, nos vemos!")
		n+=1
		if (n>5) game.stop()
	}
}