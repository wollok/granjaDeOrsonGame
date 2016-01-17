object espada {
	val posOriginal = new Position(3,1)
	val imagen = "espada.gif"
	var posicion = new Position(3,1)
	
	method posicion() = posicion
	method setPosicion(p) { posicion = p }
	
	method usar(granjero) {
		granjero.cosecha()
	}
}