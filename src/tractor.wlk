object tractor {
	var n = 0
	var imagen = "tractor.png"	
	var posicion
	
	method init(_posicion) {
		posicion = _posicion
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
		imagen = "granjero_tractor.png"
		posicion = granjero.posicion()
		posicion.moveLeft(1)
		posicion.say(granjero, "Muchas gracias por ayudarme, nos vemos!")
		n++
		if (n>5) wgame.stop()
	}
}