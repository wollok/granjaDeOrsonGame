object regadera {
	val posOriginal = new Position(3,1)
	val imagen = "spot.png"
	var posicion = new Position(3,1)
	
	method posicion() = posicion
	method setPosicion(p) { posicion = p }
	
	method usar(granjero) {
		granjero.rega()
	}
}