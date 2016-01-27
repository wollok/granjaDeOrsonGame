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
			granjero.restaOro(200)
			this.win(granjero)
		} catch e {
			granjero.posicion().moveRight(1)
			throw e	
		}
	}
	
	method win(granjero) {
//		wgame.removeVisual(granjero)
		imagen = "granjero_tractor.png"
		[posicion, granjero.posicion()].forEach{it => it.moveLeft(1)}
		console.println(n++)
		if (n>10) wgame.stop()
	}
}