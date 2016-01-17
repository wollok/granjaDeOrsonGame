import cultivos.*

object granjero {
	var oro = 25
	var cultivos = []
	var posicion = new Position(3, 3)
	
	method oro() = oro

	method sumarOro(cantidad) { oro += cantidad }

	method plantar(cultivo) { cultivos.add(cultivo) }
	
	
	method cosechaTodo() {
		cultivos.forEach { c => c.cosechate(this) }
		cultivos.clear()
	}

//********************************************************
//********************************************************

	method plantaMaiz() {
		this.planta(new Maiz())
	}

	method plantaTrigo() {
		this.planta(new Trigo())
	
	}
	method plantaTomaco() {
		this.planta(new Tomaco())
	}

	method planta(cultivo) {
		this.restarOro(25)
		this.plantar(cultivo)
		posicion.clone().drawElement(cultivo)
	}
	
	method restarOro(cantidad) {
		if (cantidad > oro)
			throw new Exception("No tengo suficiente dinero para eso")
			
		this.sumarOro(-cantidad)
	}
	
	method rega() {
		var cultivosARegar = posicion.getAllElements()
			.filter { obj => !(this == obj) }
			
		if (cultivosARegar.isEmpty())
			throw new Exception("No hay nada que regar")
			
		cultivosARegar.forEach { cultivo => cultivo.crece() }
	}
	
	method getPosicion() = posicion
	method getImagen() = "player.png"
}
