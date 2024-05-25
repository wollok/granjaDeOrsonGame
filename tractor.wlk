import wollok.game.*
object tractor {
	var n = 0
	var property image = "tractor.png"	
	var property position = new Position(x = 9, y = 4)
	
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